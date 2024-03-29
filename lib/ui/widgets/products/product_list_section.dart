import 'package:diiket/data/providers/products/products_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/products/loading/horizontal_scroll_product_list_loading.dart';
import 'package:diiket/ui/widgets/products/product_feed_banner.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/custom_exception_message.dart';
import 'horizontal_scroll_product_list.dart';

class ProductListSection extends HookWidget {
  final ProductFeed productFeed;

  const ProductListSection({
    Key? key,
    required this.productFeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = productProvider(
      ProductProviderDetail(
        source: productFeed.type,
        query: productFeed.query,
        limit: productFeed.limit,
      ),
    );

    final productState = useProvider(provider);
    final productNotifier = useProvider(provider.notifier);

    if (productState.data?.value.data?.isEmpty == true) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        ProductFeedBanner(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 8.0,
            bottom: 4.0,
          ),
          productFeed: productFeed,
          imageOnly: true,
          onTap: () {
            Utils.navigateToProductByCategory(productFeed);
          },
        ),
        _buildHeader(),
        productState.when(
          data: (products) => HorizontalScrollProductList(
            onLoadMore: () async {
              await productNotifier.loadMore();

              return false;
            },
            isFinish: productNotifier.nextPage == null,
            products: products.data ?? [],
          ),
          loading: () => HorizontalScrollProductListLoading(),
          error: (error, stackTrace) => CustomExceptionMessage(error),
        ),
      ],
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 20,
        bottom: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              productFeed.title,
              style: kTextTheme.headline2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            onPressed: () {
              Utils.navigateToProductByCategory(productFeed);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(4),
              primary: ColorPallete.primaryColor,
            ),
            child: Text('Lihat Semua'),
          ),
        ],
      ),
    );
  }
}
