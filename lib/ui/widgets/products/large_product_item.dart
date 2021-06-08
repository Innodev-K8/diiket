import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/stall/stall_page.dart';
import 'package:diiket/ui/widgets/auth_wrapper.dart';
import 'package:diiket/ui/widgets/login_to_continue_button.dart';
import 'package:diiket/ui/widgets/number_spinner.dart';
import 'package:diiket/ui/widgets/products/product_price_text.dart';
import 'package:diiket/ui/widgets/simple_button.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LargeProductItem extends StatelessWidget {
  final Product product;
  final Function? onTap;
  final bool readonly;

  const LargeProductItem({
    Key? key,
    required this.product,
    this.onTap,
    this.readonly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isStoreOpen = product.stall?.is_open == true;
    final isAnyProcessedOrder = context.read(activeOrderProvider) != null &&
        context.read(activeOrderProvider)!.status != 'unconfirmed';

    return AbsorbPointer(
      absorbing: !isStoreOpen,
      child: InkWell(
        onTap: () {
          if (onTap != null) return onTap?.call();

          Utils.homeNav.currentState!.pushNamed(
            StallPage.route,
            arguments: {
              'stall_id': product.stall_id,
            },
          );
        },
        child: Container(
          height: 138.0,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: ColorPallete.lightGray.withOpacity(0.5),
            ),
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: isStoreOpen ? 1 : 0.5,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: product.photo_url ??
                              'https://diiket.rejoin.id/images/placeholders/product.jpg',
                          fit: BoxFit.fitHeight,
                          height: double.infinity,
                          placeholder: (context, url) => Center(
                            child: SizedBox(
                              width: 48,
                              height: 48,
                              child: CircularProgressIndicator(
                                color: ColorPallete.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? '-',
                            style: kTextTheme.headline6,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            '${product.stall?.name}, ${product.stall?.seller?.name}',
                            style: kTextTheme.overline!.copyWith(
                              // fontWeight: FontWeight.bold,
                              color: ColorPallete.darkGray,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(flex: 1),
                          ProductPiceText(product: product),
                          Spacer(flex: 4),
                          if (readonly || isAnyProcessedOrder)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: _buildReadOnlyContent(),
                            )
                          else
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
              ),
              if (!isStoreOpen) _buildStoreClosedBanner()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreClosedBanner() {
    return Center(
      child: Container(
        width: 136,
        decoration: BoxDecoration(
          color: ColorPallete.blueishGray,
          border: Border.all(
            color: ColorPallete.secondaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_rounded,
              color: ColorPallete.secondaryColor,
              size: 12,
            ),
            SizedBox(width: 6),
            Text(
              'Toko Tutup',
              style: kTextTheme.button!.copyWith(
                color: ColorPallete.secondaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
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

  Widget _buildReadOnlyContent() {
    return Consumer(
      builder: (context, watch, child) {
        watch(activeOrderProvider);

        final OrderItem? orderItem = context
            .read(activeOrderProvider.notifier)
            .getOrderItemByProduct(product);

        if (orderItem != null) {
          return Text(
            '${orderItem.quantity} ${product.quantity_unit}',
            style: kTextTheme.caption!.copyWith(
              color: ColorPallete.primaryColor,
            ),
            textAlign: TextAlign.end,
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
