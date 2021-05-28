import 'package:diiket/data/models/product.dart';
import 'package:diiket/ui/widgets/products/large_product_item.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

class VerticalScrollProductList extends StatelessWidget {
  final List<Product> products;

  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget? header;

  const VerticalScrollProductList({
    Key? key,
    required this.products,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty)
      return Center(
        child: Text('Tidak ada produk yang dapat ditampilkan'),
      );

    return ListView.separated(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: header == null ? products.length : products.length + 1,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) {
        if (header != null) {
          if (index == 0) {
            return header!;
          }

          index -= 1;
        }

        return Entry.scale(
          delay: Duration(milliseconds: 25 * index),
          child: LargeProductItem(
            product: products[index],
          ),
        );
      },
    );
  }
}
