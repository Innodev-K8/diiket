import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/stall/stall_page.dart';
import 'package:diiket/ui/widgets/auth_wrapper.dart';
import 'package:diiket/ui/widgets/login_to_continue_button.dart';
import 'package:diiket/ui/widgets/products/add_product_to_cart_action.dart';
import 'package:diiket/ui/widgets/products/product_price_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'product_in_cart_information.dart';

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
              'focused_product_id': product.id,
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
                          errorWidget: (context, url, error) => Image.network(
                            'https://diiket.rejoin.id/images/placeholders/product.jpg',
                            fit: BoxFit.cover,
                          ),
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
                            maxLines: 1,
                          ),
                          Text(
                            product.description ?? '-',
                            style: kTextTheme.overline!.copyWith(
                              // fontWeight: FontWeight.bold,
                              color: ColorPallete.darkGray,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Spacer(flex: 1),
                          ProductPiceText(product: product),
                          Spacer(flex: 4),
                          if (readonly || isAnyProcessedOrder)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ProductInCartInformation(product: product),
                            )
                          else
                            AuthWrapper(
                              auth: (_) =>
                                  AddProductToCartAction(product: product),
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
}
