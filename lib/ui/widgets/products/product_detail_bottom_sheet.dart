import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/recombee_provider.dart';
import 'package:diiket/data/services/dynamic_link_generators.dart';
import 'package:diiket/ui/widgets/auth/auth_wrapper.dart';
import 'package:diiket/ui/widgets/auth/login_to_continue_button.dart';
import 'package:diiket/ui/widgets/products/add_product_to_cart_action.dart';
import 'package:diiket/ui/widgets/products/product_in_cart_information.dart';
import 'package:diiket/ui/widgets/products/product_photo.dart';
import 'package:diiket/ui/widgets/products/product_price_text.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:recombee_client/recombee_client.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailBottomSheet extends HookWidget {
  static Future<void> show(BuildContext context, Product product) {
    final user = context.read(authProvider);

    if (user != null) {
      final recombee = context.read(recombeeProvider);

      recombee.send(AddDetailView(
        userId: user.id,
        itemId: product.id,
        ),
      );
    }

    return showModalBottomSheet(
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
        context.read(activeOrderProvider)!.status != OrderStatus.unconfirmed;

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
      child: DecoratedBox(
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
                ProductPhoto(
                  product: product,
                  isSquare: true,
                ),
                SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.name ?? '-',
                        style: kTextTheme.displayMedium,
                      ),
                    ),
                    SizedBox(width: 8),
                    ProductShareButton(product: product),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  product.description ?? '-',
                  style: kTextTheme.labelSmall!.copyWith(
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

class ProductShareButton extends HookWidget {
  const ProductShareButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);
    final isMounted = useIsMounted();
    final dlGenerator = useProvider(dynamicLinkGeneratorProvider);


    return InkWell(
      onTap: () async {
        if (product.stall == null) return;

        if (isMounted()) isLoading.value = true;

        final uri = await dlGenerator.generateStallDeepLink(
          product.stall!,
          product: product,
          referrer: context.read(authProvider),
        );

        await Share.share(uri.toString());

        if (isMounted()) isLoading.value = false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: isLoading.value
            ? SmallLoading()
            : Icon(
                Icons.share,
                size: 18.0,
                color: ColorPallete.darkGray,
              ),
      ),
    );
  }
}
