import 'package:diiket/data/providers/products/products_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/custom_exception_message.dart';
import 'package:diiket/ui/widgets/orders/order_preview_panel.dart';
import 'package:diiket/ui/widgets/products/loading/vertical_scroll_product_list_loading.dart';
import 'package:diiket/ui/widgets/products/vertical_scroll_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsByCategoryPage extends HookWidget {
  static const String route = '/home/products/category';

  final String category;
  final String? label;

  const ProductsByCategoryPage({
    Key? key,
    required this.category,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String labelText = label ?? category;

    final provider = productProvider(category);

    final productState = useProvider(provider);
    // final productNotifier = useProvider(provider.notifier);

    return SafeArea(
      child: Container(
        color: ColorPallete.backgroundColor,
        child: Column(
          children: [
            _buildAppBar(labelText),
            Expanded(
              child: productState.when(
                data: (results) => VerticalScrollProductList(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20.0,
                  ),
                  physics: BouncingScrollPhysics(),
                  products: results.data ?? [],
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Text(
            '${labelText}',
            style: kTextTheme.headline2,
          ),
        ],
      ),
    );
  }
}
