import 'package:diiket/data/models/product.dart';
import 'package:diiket/ui/widgets/loading.dart';
import 'package:diiket/ui/widgets/products/large_product_item.dart';
import 'package:flutter/material.dart';

class LargeProductItemLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Loading(
      child: LargeProductItem(product: Product.fake()),
    );
  }
}
