import 'package:diiket/data/models/product_feed.dart';
import 'package:diiket/data/providers/products/product_feeds_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/search/search_page.dart';
import 'package:diiket/ui/widgets/category_menu.dart';
import 'package:diiket/ui/widgets/products/product_list_section.dart';
import 'package:diiket/ui/widgets/search_field.dart';
import 'package:diiket/ui/widgets/stall/favorite_stalls.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'feed_header.dart';

class FeedPage extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: FeedHeader()),
          SliverAppBar(
            backgroundColor: ColorPallete.backgroundColor,
            elevation: 1,
            pinned: true,
            toolbarHeight: 45 + 16,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
              child: GestureDetector(
                onTap: () => Utils.homeNav.currentState!.pushNamed(
                  SearchPage.route,
                  arguments: {
                    'search_autofocus': true,
                  },
                ),
                child: Hero(
                  tag: 'search-field',
                  child: SearchField(
                    enabled: false,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Atau butuh sesuatu?'),
                  CategoryMenu(),
                  // MarketSelector(),
                  FavoriteStalls(),
                ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 24),
            sliver: Consumer(
              builder: (_, watch, child) {
                final List<ProductFeed> feeds = watch(productFeedProvider);
          
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final ProductFeed feed = feeds[index];

                      if (feed.label == null || feed.query == null)
                        return SizedBox();

                      return ProductListSection(
                        label: feed.label!,
                        category: feed.query!,
                      );
                    },
                    childCount: feeds.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: 14,
      ),
      child: Text(
        text,
        style: kTextTheme.headline2,
      ),
    );
  }
}
