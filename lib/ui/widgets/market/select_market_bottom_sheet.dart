import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/market/market_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectingMarketProvider = StateProvider<bool>((_) => false);

class SelectMarketBottomSheet extends HookWidget {
  static Future<void> show(BuildContext context,
      {bool isHomeContext = false}) async {
    final isSelectingMarket = context.read(selectingMarketProvider).state;

    if (isSelectingMarket) return;

    final currentMarket = context.read(currentMarketProvider).state;

    context.read(selectingMarketProvider).state = true;

    // disable close when we havent select any market
    final result = await showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: currentMarket != null,
      isDismissible: currentMarket != null,
      builder: (BuildContext context) {
        return SelectMarketBottomSheet(isHomeContext: isHomeContext);
      },
    );

    context.read(selectingMarketProvider).state = false;

    return result;
  }

  const SelectMarketBottomSheet({
    Key? key,
    this.isHomeContext = false,
  }) : super(key: key);

  // use smaller bottom padding if showing this BottomSheet in home
  final bool isHomeContext;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final currentMarket = context.read(currentMarketProvider).state;

        // close app if there is no option, eg: diiket is not yet supported in users area
        final nearbyMarket = context.read(nearbyMarketsProvider).maybeWhen(
              data: (markets) => markets,
              orElse: () => [],
            );

        if (currentMarket == null && nearbyMarket.isEmpty) {
          await SystemNavigator.pop();

          return false;
        }

        // disable close when we haven't select any market
        return currentMarket != null;
      },
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
        child: Container(
          decoration: BoxDecoration(
            color: ColorPallete.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.0),
              topRight: Radius.circular(14.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0),
                  Text(
                    'Pilih Pasar',
                    style: kTextTheme.headline1,
                  ),
                  Text('Pilih pasar terdekat untuk mulai berbelanja!'),
                  SizedBox(height: 16.0),
                  MarketSelector(
                    onSelected: (market) => Navigator.of(context).pop(),
                  ),
                  SizedBox(height: isHomeContext ? 8 : 38.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
