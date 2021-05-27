import 'package:diiket/data/providers/products/products_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/category_menu.dart';
import 'package:diiket/ui/widgets/products/product_list_section.dart';
import 'package:diiket/ui/widgets/search_field.dart';
import 'package:flutter/material.dart';

import 'feed_header.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeedHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () => Utils.homeNav.currentState!.pushNamed(
                  '/home/search',
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
            _buildSectionTitle('Atau butuh sesuatu?'),
            CategoryMenu(),
            // MarketSelector(),
            ProductListSection(
              label: 'Produk',
              category: ProductFamily.all,
            ),
            ProductListSection(
              label: 'Terlaris',
              category: ProductFamily.popular,
            ),
          ],
        ),
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
