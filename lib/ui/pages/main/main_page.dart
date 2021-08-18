import 'package:diiket/data/providers/main_page_controller_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/common/custom_bottom_navigation_bar.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cart/cart_page.dart';
import 'history/history_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class MainPage extends HookWidget {
  static const route = '/';

  final pages = [
    HomePage(),
    CartPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final pageController = useProvider(mainPageController.notifier);

    final currentBackPressTime = useState<DateTime?>(null);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: ColorPallete.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: WillPopScope(
            onWillPop: () async {
              if (context.read(mainPageController) == 0 &&
                  Utils.homeNav.currentState?.canPop() == true) {
                return true;
              }

              if (context.read(mainPageController) != 0) {
                context.read(mainPageController.notifier).setPage(0);

                return false;
              }

              return _doubleBackCheck(currentBackPressTime, context);
            },
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController.controller,
              children: pages,
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }

  bool _doubleBackCheck(
    ValueNotifier<DateTime?> currentBackPressTime,
    BuildContext context,
  ) {
    final DateTime now = DateTime.now();

    if (currentBackPressTime.value == null ||
        now.difference(currentBackPressTime.value!) > Duration(seconds: 2)) {
      currentBackPressTime.value = now;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tekan lagi untuk keluar'),
          duration: Duration(seconds: 2),
          backgroundColor: ColorPallete.accentColor,
        ),
      );

      return false;
    }

    return true;
  }
}
