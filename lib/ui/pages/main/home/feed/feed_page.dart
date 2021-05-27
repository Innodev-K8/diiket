import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/providers/products/products_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/category_menu.dart';
import 'package:diiket/ui/widgets/custom_exception_message.dart';
import 'package:diiket/ui/widgets/products/product_list_section.dart';
import 'package:diiket/ui/widgets/search_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

class MarketSelector extends HookWidget {
  const MarketSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nearbyMarketState = useProvider(nearbyMarketsProvider);
    final currentMarket = useProvider(currentMarketProvider).state;

    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
      ),
      child: nearbyMarketState.when(
        data: (markets) => DropdownSearch<Market>(
          mode: Mode.MENU,
          showSelectedItem: true,
          compareFn: (item, selectedItem) => item.id == selectedItem?.id,
          selectedItem: currentMarket,
          items: markets,
          label: "Pasar",
          itemAsString: (Market m) => m.name ?? '-',
          hint: "Pilih pasar tempat Anda ingin berbelanja.",
          showSearchBox: true,
          dropdownSearchDecoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: ColorPallete.deadColor.withOpacity(0.5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2.0,
                color: ColorPallete.primaryColor,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: 'Bumbu, Daging Sapi',
            suffixIconConstraints: BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
          ),
          onChanged: (Market? market) {
            if (market != null)
              context.read(currentMarketProvider).state = market;
          },
        ),
        loading: () => Text('Mencari Pasar Terdekat...'),
        error: (e, st) => CustomExceptionMessage(e),
      ),
    );
  }
}
