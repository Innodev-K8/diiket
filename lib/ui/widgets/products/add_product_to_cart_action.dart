import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/recombee_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/products/product_in_cart_information.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recombee_client/recombee_client.dart';

import '../number_spinner.dart';
import '../simple_button.dart';

class AddProductToCartAction extends HookWidget {
  final Product product;
  final bool isLarge;

  const AddProductToCartAction({
    Key? key,
    required this.product,
    this.isLarge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useProvider(activeOrderProvider);

    final bool isProductInOrder =
        context.read(activeOrderProvider.notifier).isProductInOrder(product);

    final isAnyProcessedOrder = context.read(activeOrderProvider) != null &&
        context.read(activeOrderProvider)!.status != 'unconfirmed';

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
      child: isAnyProcessedOrder
          ? Align(
              alignment: Alignment.bottomRight,
              child: ProductInCartInformation(product: product),
            )
          : (isProductInOrder
              ? _buildNumberSpinner(context)
              : _buildAddToCart(context)),
    );
  }

  Widget _buildNumberSpinner(BuildContext context) {
    final OrderItem? orderItem = context
        .read(activeOrderProvider.notifier)
        .getOrderItemByProduct(product);

    return SizedBox(
      // width:
      //     isLarge ? MediaQuery.of(context).size.width * 0.5 : double.infinity,
      child: Row(
        mainAxisAlignment:
            isLarge ? MainAxisAlignment.end : MainAxisAlignment.spaceBetween,
        children: [
          if (isLarge) Spacer(),
          Expanded(
            child: SimpleButton(
              onTap: () {
                if (orderItem == null) return;

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
            key: UniqueKey(),
            initialValue: orderItem?.quantity ?? 1,
            onChanged: (value) {
              if (orderItem == null) return;

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
      ),
    );
  }

  Widget _buildAddToCart(BuildContext context) {
    final isPlacingOrder = useState<bool>(false);
    final isMounted = useIsMounted();

    void addToCart() {
      isPlacingOrder.value = true;

      final user = context.read(authProvider);

      if (user != null) {
        final recombee = context.read(recombeeProvider);

        recombee.send(AddCartAddition(
          userId: user.id,
          itemId: product.id,
        ));
      }

      context
          .read(activeOrderProvider.notifier)
          .placeOrderItem(product, 1)
          .whenComplete(
        () {
          if (isMounted()) {
            isPlacingOrder.value = false;
          }
        },
      );
    }

    final buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      elevation: 0,
      primary: product.stall?.is_open == true
          ? ColorPallete.primaryColor
          : ColorPallete.lightGray,
    );

    late Widget button;

    if (isPlacingOrder.value) {
      button = ElevatedButton(
        onPressed: () {},
        style: buttonStyle,
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        ),
      );
    } else {
      button = ElevatedButton.icon(
        onPressed: addToCart,
        style: buttonStyle,
        icon: Icon(
          Icons.add_rounded,
          size: isLarge ? 22.0 : 14.0,
        ),
        label: Text(
          'Keranjang',
          style: kTextTheme.button!.copyWith(
            fontSize: isLarge ? 16.0 : 10.0,
          ),
        ),
      );
    }

    return Align(
      alignment: isLarge ? Alignment.center : Alignment.bottomRight,
      child: SizedBox(
        height: isLarge ? 48 : 28,
        width: isLarge ? double.infinity : null,
        child: button,
      ),
    );
  }
}
