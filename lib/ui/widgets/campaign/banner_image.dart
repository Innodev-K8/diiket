import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/loading.dart';
import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final String imageUrl;

  const BannerImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Loading(
          child: Container(
            color: ColorPallete.lightGray,
          ),
        ),
      ),
    );
  }
}
