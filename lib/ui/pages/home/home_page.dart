import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/home/feed/feed_page.dart';
import 'package:diiket/ui/pages/home/stall/stall_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await Utils.homeNav.currentState!.maybePop();
      },
      child: Navigator(
        key: Utils.homeNav,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          Widget page;

          switch (settings.name) {
            case '/home/stall':
              page = StallPage();
              break;
            case '/':
            default:
              page = FeedPage();
          }

          return PageTransition(
            type: PageTransitionType.fade,
            child: page,
          );
        },
      ),
    );
  }
}
