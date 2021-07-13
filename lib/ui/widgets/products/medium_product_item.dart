import 'package:diiket/data/models/product.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/products/product_photo.dart';
import 'package:diiket/ui/widgets/products/product_price_text.dart';
import 'package:flutter/material.dart';

class MediumProductItem extends StatelessWidget {
  final Product product;

  // set the material color to transparent so the shimmer works
  final bool isForLoading;

  const MediumProductItem({
    Key? key,
    required this.product,
    this.isForLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 15),
            blurRadius: 70,
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Material(
        color: isForLoading ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: isForLoading
              ? null
              : () {
                  Utils.navigateToStall(product.stall_id!, product.id);
                },
          child: SizedBox(
            width: 140,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductPhoto(
                    product: product,
                    isSquare: true,
                  ),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name ?? '-',
                          style: kTextTheme.headline6,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Spacer(flex: 3),
                        ProductPiceText(product: product),
                        Spacer(),
                        Text(
                          product.stall?.name ?? '-',
                          style: kTextTheme.caption,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
