import 'package:diiket/ui/widgets/products/loading/large_product_item_loading.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerticalScrollProductListLoading extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget? header;
  final Widget? footer;

  int _listLength = 0;

  VerticalScrollProductListLoading({
    Key? key,
    this.padding,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
    this.header,
    this.footer,
  }) : super(key: key) {
    // define how many products placeholder
    _listLength = 10;

    if (header != null) {
      _listLength++;
    }

    if (footer != null) {
      _listLength++;
    }
  }

  @override
  Widget build(BuildContext context) {
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

        return LargeProductItemLoading();
      },
    );
  }
}
