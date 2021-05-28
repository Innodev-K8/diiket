import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/orders/order_preview_panel.dart';
import 'package:diiket/ui/widgets/products/vertical_scroll_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final String labelText = label ?? category;

    // final provider = productProvider(category);

    final order = useProvider(activeOrderProvider);

    // // final productNotifier = useProvider(provider.notifier);

    return SafeArea(
      child: Container(
        color: ColorPallete.backgroundColor,
        child: Column(
          children: [
            _buildAppBar('Keranjang'),
            Expanded(
              child: VerticalScrollProductList(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20.0,
                ),
                physics: BouncingScrollPhysics(),
                products: (order?.order_items ?? [])
                    .map((item) => item.product!)
                    .toList(),
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
      child: Center(
        child: Text(
          '${labelText}',
          style: kTextTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
