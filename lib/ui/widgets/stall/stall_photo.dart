import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';

class StallPhoto extends StatelessWidget {
  static final placeholderImage = Image.asset(
    'assets/images/placeholders/stall.jpg',
    fit: BoxFit.cover,
  );

  const StallPhoto({
    Key? key,
    required this.stall,
  }) : super(key: key);

  final Stall stall;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: AspectRatio(
        aspectRatio: 1,
        child: stall.photo_url != null
            ? CachedNetworkImage(
                imageUrl: stall.photo_url!,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => placeholderImage,
                placeholder: (context, url) => placeholderImage,
              )
            : placeholderImage,
      ),
    );
  }
}
