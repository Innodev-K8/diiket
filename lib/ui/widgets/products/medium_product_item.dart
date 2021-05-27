import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/ui/common/styles.dart';
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
      width: 140,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorPallete.deadColor.withOpacity(0.5),
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl:
                      product.photo_url ?? 'https://via.placeholder.com/150',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) => Text('ini placehoilder'),
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
                    Text(
                      '${product.price}/${product.quantity_unit}',
                      style: kTextTheme.subtitle2,
                      overflow: TextOverflow.ellipsis,
                    ),
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
    );
  }
}
