import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/products/product_price_text.dart';
import 'package:flutter/material.dart';

class MediumProductItem extends StatelessWidget {
  final Product product;

  const MediumProductItem({
    Key? key,
    required this.product,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            Utils.navigateToStall(product.stall_id!, product.id);
          },
          child: Container(
            width: 140,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: product.photo_url ??
                            'https://diiket.rejoin.id/images/placeholders/product.jpg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Image.network(
                          'https://diiket.rejoin.id/images/placeholders/product.jpg',
                          fit: BoxFit.cover,
                        ),
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            width: 48,
                            height: 48,
                            child: CircularProgressIndicator(
                              color: ColorPallete.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                        Spacer(flex: 1),
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
