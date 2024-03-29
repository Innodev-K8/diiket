import 'package:diiket/ui/widgets/common/loading.dart';
import 'package:diiket/ui/widgets/products/medium_product_item.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';

class MediumProductItemLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Loading(
      child: SizedBox(
        height: 230.0,
        child: MediumProductItem(
          product: Product.fake(),
          isForLoading: true,
        ),
      ),
    );
  }
}
