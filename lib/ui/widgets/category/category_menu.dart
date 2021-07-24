import 'package:diiket/data/providers/products/product_category_menu_items_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final categories = useProvider(productCategoryMenuItemsProvider);

    return SizedBox(
      height: 100.0,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemBuilder: (context, index) => categories[index],
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }
}
