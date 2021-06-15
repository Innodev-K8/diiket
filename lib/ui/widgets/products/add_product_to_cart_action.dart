import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../number_spinner.dart';
import '../simple_button.dart';

class AddProductToCartAction extends HookWidget {
  final Product product;

  const AddProductToCartAction({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useProvider(activeOrderProvider);

    final bool isProductInOrder =
        context.read(activeOrderProvider.notifier).isProductInOrder(product);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      switchInCurve: Curves.easeInQuint,
      switchOutCurve: Curves.easeOutQuint,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween(
            begin: Offset(0, 0.5),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        ),
      ),
      child: isProductInOrder
          ? _buildNumberSpinner(context)
          : _buildAddToCart(context),
    );
  }

  Widget _buildNumberSpinner(BuildContext context) {
    final OrderItem orderItem = context
        .read(activeOrderProvider.notifier)
        .getOrderItemByProduct(product)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SimpleButton(
            onTap: () {
              context
                  .read(activeOrderProvider.notifier)
                  .deleteOrderItem(orderItem);
            },
            child: Text(
              'Batal',
              style: kTextTheme.button!.copyWith(
                fontSize: 11.0,
                color: ColorPallete.darkGray,
              ),
            ),
          ),
        ),
        SizedBox(width: 4.0),
        NumberSpinner(
          key: ValueKey(orderItem.id),
          initialValue: orderItem.quantity ?? 1,
          onChanged: (value) {
            if (value <= 0) {
              context
                  .read(activeOrderProvider.notifier)
                  .deleteOrderItem(orderItem);
            } else {
              // debounce tiap 1 detik biar server nggak overload
              EasyDebounce.debounce(
                '${product.id}-order-item-debouncer',
                Duration(seconds: 1),
                () {
                  context.read(activeOrderProvider.notifier).updateOrderItem(
                        orderItem,
                        quantity: value,
                      );
                },
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildAddToCart(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 28,
        child: ElevatedButton.icon(
          onPressed: () {
            context
                .read(activeOrderProvider.notifier)
                .placeOrderItem(product, 1);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            elevation: 0,
            primary: product.stall?.is_open == true
                ? ColorPallete.primaryColor
                : ColorPallete.lightGray,
          ),
          icon: Icon(
            Icons.add_rounded,
            size: 14.0,
          ),
          label: Text(
            'Keranjang',
            style: kTextTheme.button!.copyWith(
              fontSize: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
