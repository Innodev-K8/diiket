import 'package:diiket/ui/pages/cart/cart_page.dart';
import 'package:diiket/ui/pages/history/history_page.dart';
import 'package:diiket/ui/pages/home/home_page.dart';
import 'package:diiket/ui/pages/profile/profile_page.dart';
import 'package:diiket/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainPage extends HookWidget {
  final pages = [
    HomePage(),
    CartPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: pages,
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          pageController: pageController,
        ),
      ),
    );
  }
}
