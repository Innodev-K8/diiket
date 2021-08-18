import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/ui/widgets/market/select_market_bottom_sheet.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MarketSelectorButton extends HookWidget {
  const MarketSelectorButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final market = useProvider(currentMarketProvider).state;

    return InkWell(
      onTap: () {
        SelectMarketBottomSheet.show(context, isHomeContext: true);
      },
      child: Container(
        decoration: kBorderedDecoration,
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                // ignore: unnecessary_string_interpolations
                market == null ? 'Pilih pasar dulu' : '${market.name}',
                style: kTextTheme.headline6!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
            ),
            Icon(
              Icons.location_on_rounded,
              color: ColorPallete.darkGray,
            ),
          ],
        ),
      ),
    );
  }
}
