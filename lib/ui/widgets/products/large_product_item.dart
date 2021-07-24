import 'package:diiket/data/models/product.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/auth/auth_wrapper.dart';
import 'package:diiket/ui/widgets/auth/login_to_continue_button.dart';
import 'package:diiket/ui/widgets/products/add_product_to_cart_action.dart';
import 'package:diiket/ui/widgets/products/product_photo.dart';
import 'package:diiket/ui/widgets/products/product_price_text.dart';
import 'package:flutter/material.dart';
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

    return AbsorbPointer(
      absorbing: !isStoreOpen,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap?.call();

            return;
          }

          Utils.navigateToStall(product.stall!.id!, product.id);
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
                      child: ProductPhoto(product: product),
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
                          Spacer(),
                          ProductPiceText(product: product),
                          Spacer(flex: 4),
                          if (readonly)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ProductInCartInformation(product: product),
                            )
                          else
                            AuthWrapper(
                              auth: (_) =>
                                  AddProductToCartAction(product: product),
                              guest: () => Align(
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
