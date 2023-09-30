import 'package:diiket/data/providers/products/products_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/common/custom_exception_message.dart';
import 'package:diiket/ui/widgets/orders/order_preview_panel.dart';
import 'package:diiket/ui/widgets/products/loading/vertical_scroll_product_list_loading.dart';
import 'package:diiket/ui/widgets/products/product_feed_banner.dart';
import 'package:diiket/ui/widgets/products/vertical_scroll_product_list.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsByCategoryPage extends HookWidget {
  static const String route = '/home/products/category';

  final ProductFeed productFeed;

  const ProductsByCategoryPage({
    Key? key,
    required this.productFeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String labelText = productFeed.title;

    final provider = productProvider(
      ProductProviderDetail(
        source: productFeed.type,
        query: productFeed.query,
        limit: productFeed.limit,
      ),
    );

    final productState = useProvider(provider);

    return SafeArea(
      child: Container(
        color: ColorPallete.backgroundColor,
        child: Column(
          children: [
            _buildAppBar(labelText),
            Expanded(
              child: productState.when(
                data: (results) => VerticalScrollProductList(
                  header: ProductFeedBanner(
                    padding: const EdgeInsets.only(bottom: 8),
                    productFeed: productFeed,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20.0,
                  ),
                  physics: BouncingScrollPhysics(),
                  products: results.data ?? [],
                  entryEnabled: false,
                ),
                loading: () => VerticalScrollProductListLoading(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20.0,
                  ),
                ),
                error: (error, stackTrace) => CustomExceptionMessage(error),
              ),
            ),
            OrderPreviewPanel(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(String labelText) {
    return Container(
      height: 78.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPallete.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: ColorPallete.lightGray.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Utils.homeNav.currentState?.pop();
            },
            padding: const EdgeInsets.symmetric(horizontal: 16),
            icon: Icon(
              Icons.chevron_left_rounded,
              color: ColorPallete.darkGray,
              size: 28.0,
            ),
          ),
          Expanded(
            child: Text(
              labelText,
              overflow: TextOverflow.ellipsis,
              style: kTextTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
