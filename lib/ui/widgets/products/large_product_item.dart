import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/auth_wrapper.dart';
import 'package:diiket/ui/widgets/login_to_continue_button.dart';
import 'package:diiket/ui/widgets/number_spinner.dart';
import 'package:diiket/ui/widgets/simple_button.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LargeProductItem extends StatelessWidget {
  final Product product;

  const LargeProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138.0,
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorPallete.lightGray.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: product.photo_url ?? '',
                fit: BoxFit.fitHeight,
                height: double.infinity,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      product.name ?? '-',
                      style: kTextTheme.headline6,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
                Text(
                  'Rp ${product.price}/${product.quantity_unit}',
                  style: kTextTheme.subtitle2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Text(
                  '${product.stall?.name}, ${product.stall?.seller?.name}',
                  style: kTextTheme.caption,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                AuthWrapper(
                  auth: (_) => _buildAction(),
                  guest: Align(
                    alignment: Alignment.bottomRight,
                    child: LoginToContinueButton(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAction() {
    return Consumer(
      builder: (context, watch, child) {
        watch(activeOrderProvider);

        final bool isProductInOrder = context
            .read(activeOrderProvider.notifier)
            .isProductInOrder(product);

        if (isProductInOrder) {
          return _buildNumberSpinner(context);
        } else {
          return _buildAddToCart(context);
        }
      },
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
            primary: ColorPallete.primaryColor,
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

