import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/data/providers/main_page_controller_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/product/products_by_category_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'feed/feed_page.dart';
import 'search/search_page.dart';
import 'stall/stall_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController(createRectTween: _createRectTween);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return WillPopScope(
      onWillPop: () async {
        if (context.read(mainPageController) != 0) {
          context.read(mainPageController.notifier).setPage(0);

          return false;
        }

        return !await Utils.homeNav.currentState!.maybePop();
      },
      child: Navigator(
        key: Utils.homeNav,
        observers: [_heroController],
        initialRoute: FeedPage.route,
        onGenerateRoute: (RouteSettings settings) {
          final Map? arguments =
              settings.arguments != null ? settings.arguments as Map : null;

          Widget page;

          switch (settings.name) {
            case StallPage.route:
              page = StallPage(
                stallId: arguments?['stall_id'] ?? 0,
                focusedProductId: arguments?['focused_product_id'] ?? null,
              );
              break;
            case SearchPage.route:
              page = SearchPage(
                autofocus: arguments?['search_autofocus'] ?? false,
              );
              break;
            case ProductsByCategoryPage.route:
              page = ProductsByCategoryPage(
                category: arguments?['category'] ?? '',
                label: arguments?['label'],
              );
              break;
            case FeedPage.route:
            default:
              page = FeedPage();
          }

          context.read(analyticsProvider).setCurrentScreen(
                screenName: settings.name,
                screenClassOverride: page.toString(),
              );

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
