import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';

class ProductPiceText extends StatelessWidget {
  const ProductPiceText({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: product.price != null
                ? FormattingHelper.formatPrice(product.price)
                : '-',
            style: kTextTheme.titleSmall!.copyWith(
              color: ColorPallete.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: '/${product.quantity_unit}',
            style: kTextTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
