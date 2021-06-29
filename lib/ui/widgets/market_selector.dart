import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/custom_exception_message.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MarketSelector extends HookWidget {
  const MarketSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nearbyMarketState = useProvider(nearbyMarketsProvider);
    final currentMarket = useProvider(currentMarketProvider).state;

    return nearbyMarketState.when(
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
          contentPadding: const EdgeInsets.only(left: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorPallete.lightGray.withOpacity(0.5),
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
    );
  }
}
