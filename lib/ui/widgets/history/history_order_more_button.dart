import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/providers/main_page_controller_provider.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/market/select_market_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryOrderMoreButton extends HookWidget {
  final OrderItem orderItem;

  const HistoryOrderMoreButton({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeOrder = useProvider(activeOrderProvider);

    if (activeOrder != null && activeOrder.status != 'unconfirmed') {
      return SizedBox();
    }

    return SizedBox(
      width: 120,
      height: 32,
      child: OutlinedButton(
        onPressed: () async {
          final currentMarket = context.read(currentMarketProvider).state;

          if (orderItem.product?.stall?.market_id != currentMarket?.id) {
            return SelectMarketBottomSheet.show(
              context,
              message:
                  'Produk ini berasal dari pasal lain, pilih pasar yang sesuai dengan produk ini.',
              onSelected: (market) async {
                // recheck if market is not the same as market stall id
                if (market.id != orderItem.product?.stall?.market_id) {
                  return Utils.alert(
                      'Pasar masih belum sesuai dengan produk yang dipilih.');
                }

                await context.read(mainPageController.notifier).setPage(0);

                Utils.resetHomeNavigation();

                Utils.navigateToStall(
                  orderItem.product!.stall_id!,
                  orderItem.product_id,
                );
              },
            );
          }

          await context.read(mainPageController.notifier).setPage(0);

          Utils.resetHomeNavigation();

          Utils.navigateToStall(
            orderItem.product!.stall_id!,
            orderItem.product_id,
          );
        },
        style: OutlinedButton.styleFrom(
          primary: ColorPallete.primaryColor,
          side: BorderSide(color: ColorPallete.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text('Pesan lagi'),
      ),
    );
  }
}
