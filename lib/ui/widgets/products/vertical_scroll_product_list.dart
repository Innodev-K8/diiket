import 'package:diiket/ui/widgets/products/large_product_item.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerticalScrollProductList extends StatelessWidget {
  final List<Product> products;

  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget? header;
  final Widget? footer;
  final void Function(Product)? onItemTap;
  final bool readonly;
  final bool entryEnabled;
  final Widget Function(Product product, int index)? productItemBuilder;

  int _listLength = 0;

  VerticalScrollProductList({
    Key? key,
    required this.products,
    this.padding,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
    this.header,
    this.footer,
    this.onItemTap,
    this.readonly = false,
    this.entryEnabled = true,
    this.productItemBuilder,
  }) : super(key: key) {
    _listLength = products.length;

    if (header != null) {
      _listLength++;
    }

    if (footer != null) {
      _listLength++;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Text('Tidak ada produk yang dapat ditampilkan'),
      );
    }

    return ListView.separated(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: _listLength,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) {
        if (footer != null) {
          if (index == _listLength - 1) {
            return footer!;
          }
        }

        if (header != null) {
          if (index == 0) {
            return header!;
          }

          index -= 1;
        }

        final Product product = products[index];

        if (productItemBuilder != null) {
          return productItemBuilder!.call(product, index);
        }

        final productItem = LargeProductItem(
          product: product,
          readonly: readonly,
          onTap: onItemTap != null
              ? () {
                  onItemTap!.call(product);
                }
              : null,
        );

        return entryEnabled
            ? Entry.scale(
                delay: Duration(milliseconds: 25 * index),
                child: productItem,
              )
            : productItem;
      },
    );
  }
}
