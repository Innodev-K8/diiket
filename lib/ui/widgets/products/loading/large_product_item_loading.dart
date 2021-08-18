import 'package:diiket/ui/widgets/common/loading.dart';
import 'package:diiket/ui/widgets/products/large_product_item.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';

class LargeProductItemLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Loading(
      child: LargeProductItem(product: Product()),
    );
  }
}
