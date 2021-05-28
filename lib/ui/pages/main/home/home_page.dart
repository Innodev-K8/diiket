import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/product/products_by_category_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'feed/feed_page.dart';
import 'search/search_page.dart';
import 'stall/stall_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController(createRectTween: _createRectTween);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await Utils.homeNav.currentState!.maybePop();
      },
      child: Navigator(
        key: Utils.homeNav,
        observers: [_heroController],
        initialRoute: '/home',
        onGenerateRoute: (RouteSettings settings) {
          final Map? arguments =
              settings.arguments != null ? settings.arguments as Map : null;

          Widget page;

          switch (settings.name) {
            case '/home/stall':
              page = StallPage();
              break;
            case '/home/search':
              page = SearchPage(
                autofocus: arguments?['search_autofocus'] ?? false,
              );
              break;
            case '/home/products/category':
              page = ProductsByCategoryPage(
                category: arguments?['category'] ?? '',
                label: arguments?['label'],
              );
              break;
            case '/home':
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

  Tween<Rect?> _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }
}
