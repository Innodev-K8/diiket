import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

class LargeProductItem extends StatelessWidget {
  final Product product;

  const LargeProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorPallete.lightGray.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: product.photo_url ?? '',
                fit: BoxFit.fitHeight,
                height: double.infinity,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? '-',
                  style: kTextTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  'Rp ${product.price}/${product.quantity_unit}',
                  style: kTextTheme.subtitle2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Text(
                  '${product.stall?.name}, ${product.stall?.seller?.name}',
                  style: kTextTheme.caption,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 24,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          elevation: 0,
                          primary: ColorPallete.primaryColor,
                        ),
                        icon: Icon(
                          Icons.add_rounded,
                          size: 14.0,
                        ),
                        label: Text(
                          'Keranjang',
                          style: kTextTheme.button!.copyWith(
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
