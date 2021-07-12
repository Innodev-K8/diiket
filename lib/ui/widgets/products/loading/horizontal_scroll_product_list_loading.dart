import 'package:diiket/ui/widgets/products/loading/medium_product_item_loading.dart';
import 'package:flutter/material.dart';

class HorizontalScrollProductListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.0,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        separatorBuilder: (context, index) => SizedBox(width: 15.0),
        itemBuilder: (context, index) => MediumProductItemLoading(),
      ),
    );
  }
}
