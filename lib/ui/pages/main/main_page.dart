import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'cart/cart_page.dart';
import 'history/history_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class MainPage extends HookWidget {
  static final route = '/';

  final pages = [
    HomePage(),
    CartPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();

    final currentBackPressTime = useState<DateTime?>(null);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: WillPopScope(
            onWillPop: () async {
              if (Utils.homeNav.currentState != null &&
                  Utils.homeNav.currentState!.canPop()) {
                return true;
              }

              return _doubleBackCheck(currentBackPressTime, context);
            },
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: pages,
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          pageController: pageController,
        ),
      ),
    );
  }

  bool _doubleBackCheck(
    ValueNotifier<DateTime?> currentBackPressTime,
    BuildContext context,
  ) {
    DateTime now = DateTime.now();

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
