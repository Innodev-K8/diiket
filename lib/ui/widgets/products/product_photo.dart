import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/product.dart';
import 'package:flutter/material.dart';

class ProductPhoto extends StatelessWidget {
  static final placeholderImage = Image.asset(
    'assets/images/placeholders/product.jpg',
    fit: BoxFit.cover,
  );

  const ProductPhoto({
    Key? key,
    required this.product,
    this.isSquare = false,
  }) : super(key: key);

  final Product? product;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    if (!isSquare) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: product?.photo_url != null
            ? CachedNetworkImage(
                imageUrl: product!.photo_url!,
                fit: BoxFit.fitHeight,
                height: double.infinity,
                errorWidget: (context, url, error) => placeholderImage,
                placeholder: (context, url) => placeholderImage,
              )
            : placeholderImage,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: AspectRatio(
        aspectRatio: 1,
        child: product?.photo_url != null
            ? CachedNetworkImage(
                imageUrl: product!.photo_url!,
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => placeholderImage,
                placeholder: (context, url) => placeholderImage,
              )
            : placeholderImage,
      ),
    );
  }
}
