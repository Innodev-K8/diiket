import 'package:diiket/data/providers/products/product_category_menu_items_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final categories = useProvider(productCategoryMenuItemsProvider);

    return SliverGrid.count(
      crossAxisCount: 4,
      childAspectRatio: 0.99,
      // physics: const BouncingScrollPhysics(),
      // padding: const EdgeInsets.symmetric(horizontal: 24.0),
      children: categories,
    );
  }
}
