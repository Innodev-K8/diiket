import 'package:diiket/data/providers/products/products_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../custom_exception_message.dart';
import 'horizontal_scroll_product_list.dart';

class ProductListSection extends HookWidget {
  final String label;
  final String category;

  const ProductListSection({
    Key? key,
    required this.label,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = productProvider(category);

    final productState = useProvider(provider);
    final productNotifier = useProvider(provider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          loading: () => Padding(
            padding: const EdgeInsets.all(24.0),
            child: CircularProgressIndicator(),
          ),
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
        top: 24,
        bottom: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: kTextTheme.headline2,
          ),
          TextButton(
            onPressed: () {},
            child: Text('Lihat Semua'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(4),
              primary: ColorPallete.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
