import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductInCartInformation extends HookWidget {
  final Product product;

  const ProductInCartInformation({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useProvider(activeOrderProvider);

    final OrderItem? orderItem = context
        .read(activeOrderProvider.notifier)
        .getOrderItemByProduct(product);

    if (orderItem != null) {
      return Text(
        '${orderItem.quantity} ${product.quantity_unit}',
        style: kTextTheme.bodySmall!.copyWith(
          color: ColorPallete.primaryColor,
        ),
        textAlign: TextAlign.end,
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
