import 'dart:convert';

import 'package:diiket/data/models/product_feed.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/data/providers/products/product_feeds_provider.dart';
import 'package:diiket/helpers/casting_helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/search/search_page.dart';
import 'package:diiket/ui/widgets/campaign/campaign_banner_carousel.dart';
import 'package:diiket/ui/widgets/category/category_menu.dart';
import 'package:diiket/ui/widgets/market/market_selector_button.dart';
import 'package:diiket/ui/widgets/products/paginated_vertical_products_sliver_grid.dart';
import 'package:diiket/ui/widgets/products/product_feed_banner.dart';
import 'package:diiket/ui/widgets/products/product_list_section.dart';
import 'package:diiket/ui/widgets/inputs/search_field.dart';
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
            child: _buildSectionTitle('Atau butuh sesuatu?'),
          ),
          CategoryMenu(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: MarketSelectorButton(),
                ),
                CampaignBanner(),
                FavoriteStalls(),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 24),
            sliver: Consumer(
              builder: (_, watch, child) {
                final List<ProductFeed> feeds = watch(productFeedProvider);
                final bool isLoggedIn = watch(authProvider) is User;

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final ProductFeed feed = feeds[index];

                      if (feed.require_auth == true && !isLoggedIn) {
                        return SizedBox();
                      }

                      return ProductListSection(
                        productFeed: feed,
                      );
                    },
                    childCount: feeds.length,
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: _buildInfiniteListBanner(context)),
          PaginatedVerticalProductsSliverGrid()
        ],
      ),
    );
  }

  Widget _buildInfiniteListBanner(BuildContext context) {
    final Map<String, dynamic> config = castOrFallback(
      jsonDecode(
        context
            .read(remoteConfigProvider)
            .getString('infinite_product_feed_config'),
      ),
      {},
    );

    final showBanner = castOrFallback(config['show_banner'], false);

    if (!showBanner) return SizedBox.shrink();

    return ProductFeedBanner(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 8.0,
        bottom: 14.0,
      ),
      productFeed: ProductFeed(
        image_url: castOrNull(config['banner_image_url']),
        description: castOrNull(config['banner_description']),
      ),
    );
  }

  Widget _buildSectionTitle(String text, {bool maxTopExtent = true}) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: maxTopExtent ? 24 : 0,
        bottom: 14,
      ),
      child: Text(
        text,
        style: kTextTheme.headline2,
      ),
    );
  }
}
