import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:diiket/data/models/product_feed.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/products/product_feeds_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/search/search_page.dart';
import 'package:diiket/ui/widgets/category_menu.dart';
import 'package:diiket/ui/widgets/loading.dart';
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
                SizedBox(height: 34.0),
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

                      if (feed.label == null ||
                          feed.query == null ||
                          (feed.require_auth == true && !isLoggedIn)) {
                        return SizedBox();
                      }

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

class CampaignBanner extends StatefulWidget {
  final bool showIndicator;
  const CampaignBanner({
    Key? key,
    this.showIndicator = false,
  }) : super(key: key);

  @override
  _CampaignBannerState createState() => _CampaignBannerState();
}

class _CampaignBannerState extends State<CampaignBanner> {
  final List<String> banners = [
    'https://firebasestorage.googleapis.com/v0/b/diiket.appspot.com/o/IHCampaign%2Fexample-campaign-banner.png?alt=media&token=a410ebe1-593a-4f02-8470-f0fd738f98e5',
    'https://firebasestorage.googleapis.com/v0/b/diiket.appspot.com/o/IHCampaign%2Fexample-store-campaign-banner.png?alt=media&token=37d56fb8-e08f-42a1-be1f-92a719777cf1',
    'https://firebasestorage.googleapis.com/v0/b/diiket.appspot.com/o/IHCampaign%2Fexample-simple-campaign-banner.png?alt=media&token=c5c45a3e-edd6-4493-9df8-6652fe26fca1',
  ];

  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: CarouselSlider.builder(
            carouselController: _controller,
            itemCount: banners.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl: banners[itemIndex],
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Loading(
                    child: Container(
                      color: ColorPallete.lightGray,
                    ),
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
              height: 160,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 8),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        if (widget.showIndicator) SizedBox(height: 8),
        if (widget.showIndicator)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: banners.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? ColorPallete.blueishGray
                              : ColorPallete.darkGray)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
      ],
    );
  }
}
