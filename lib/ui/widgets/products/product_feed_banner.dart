import 'package:diiket/ui/widgets/campaign/banner_image.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';

class ProductFeedBanner extends StatelessWidget {
  const ProductFeedBanner({
    Key? key,
    required this.productFeed,
    this.padding,
    this.imageOnly = false,
    this.onTap,
  }) : super(key: key);

  final ProductFeed productFeed;
  final EdgeInsets? padding;
  final bool imageOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDescriptionAvailable = productFeed.description != null;
    final isBannerImage = productFeed.image_url != null;

    if (!isDescriptionAvailable && !isBannerImage) {
      return SizedBox.shrink();
    }

    if (!isBannerImage && imageOnly) {
      return SizedBox.shrink();
    }

    final message = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: isDescriptionAvailable
          ? BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: ColorPallete.secondaryColor,
                  width: 4.0,
                ),
              ),
            )
          : null,
      child: Text(
        productFeed.description ?? '',
        style: kTextTheme.bodyMedium!.copyWith(
          color: isBannerImage
              ? ColorPallete.backgroundColor
              : ColorPallete.textColor,
        ),
      ),
    );

    Widget widget;

    if (!isBannerImage) {
      widget = message;
    } else {
      widget = Stack(
        children: [
          SizedBox(
            height: 160,
            width: double.infinity,
            child: BannerImage(
              imageUrl: productFeed.image_url!,
            ),
          ),
          if (isDescriptionAvailable)
            Container(
              height: 160.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.1),
                  ],
                  stops: const [0.0, 0.2, 1.0],
                ),
              ),
            ),
          Positioned(left: 8, right: 8, bottom: 10, child: message),
        ],
      );
    }

    if (isBannerImage) {
      widget = Hero(
        tag: productFeed.image_url!,
        child: widget,
      );
    }

    if (onTap != null) {
      widget = GestureDetector(
        onTap: onTap,
        child: widget,
      );
    }

    return Padding(
      padding: padding ?? const EdgeInsets.only(),
      child: widget,
    );
  }
}
