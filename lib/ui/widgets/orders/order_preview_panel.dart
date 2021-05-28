import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderPreviewPanel extends HookWidget {
  const OrderPreviewPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // just for watching the state changes
    final order = useProvider(activeOrderProvider);

    final bool isOrderEmpty =
        order?.order_items == null || order!.order_items!.isEmpty;

    final activeOrderNotifier = context.read(activeOrderProvider.notifier);

    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      height: isOrderEmpty ? 0 : 100.0,
      decoration: BoxDecoration(
        color: ColorPallete.backgroundColor,
        border: Border(
          top: BorderSide(
            color: ColorPallete.lightGray.withOpacity(0.5),
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jumlah Barang',
                  style: kTextTheme.subtitle1!.copyWith(
                    color: ColorPallete.darkGray.withOpacity(0.6),
                  ),
                ),
                Text(
                  '${activeOrderNotifier.orderCount} Barang',
                  style: kTextTheme.subtitle1!.copyWith(
                    color: ColorPallete.darkGray,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          DottedLine(
            dashColor: ColorPallete.lightGray,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga',
                  style: kTextTheme.headline6!.copyWith(
                    color: ColorPallete.darkGray,
                  ),
                ),
                Text(
                  'Rp. ${activeOrderNotifier.totalProductPrice}',
                  style: kTextTheme.subtitle1!.copyWith(
                    color: ColorPallete.secondaryColor,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
