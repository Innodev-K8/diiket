import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/services/dynamic_link_generators.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/auth_wrapper.dart';
import 'package:diiket/ui/widgets/products/product_in_cart_information.dart';
import 'package:diiket/ui/widgets/products/product_price_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../login_to_continue_button.dart';
import 'add_product_to_cart_action.dart';

class ProductDetailBottomSheet extends HookWidget {
  static Future<void> show(BuildContext context, Product product) {
    return showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ProductDetailBottomSheet(
          product: product,
        );
      },
    );
  }

  final Product product;

  const ProductDetailBottomSheet({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isStoreOpen = product.stall?.is_open == true;
    final isAnyProcessedOrder = context.read(activeOrderProvider) != null &&
        context.read(activeOrderProvider)!.status != 'unconfirmed';

    return Padding(
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
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 48,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: AspectRatio(
                    aspectRatio: 1,
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
                SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.name ?? '-',
                        style: kTextTheme.headline2,
                      ),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () async {
                        if (product.stall == null) return;

                        final uri =
                            await DynamicLinkGenerators.generateStallDeepLink(
                          product.stall!,
                          product: product,
                          referrer: context.read(authProvider),
                        );

                        Share.share(uri.toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Icon(
                          Icons.share,
                          size: 18.0,
                          color: ColorPallete.darkGray,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  (product.description ?? '-'),
                  style: kTextTheme.overline!.copyWith(
                    // fontWeight: FontWeight.bold,
                    color: ColorPallete.darkGray,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(height: 16.0),
                ProductPiceText(product: product),
                SizedBox(height: 16.0),
                if (isAnyProcessedOrder)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ProductInCartInformation(product: product),
                  )
                else
                  AuthWrapper(
                    auth: (_) => AddProductToCartAction(
                      product: product,
                      isLarge: true,
                    ),
                    guest: () => Align(
                      alignment: Alignment.bottomRight,
                      child: LoginToContinueButton(),
                    ),
                  ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
