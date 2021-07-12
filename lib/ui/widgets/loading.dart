import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// Use this widget thow show shimmer effect.
class Loading extends StatelessWidget {
  final Widget child;

  const Loading({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorPallete.blueishGray,
      highlightColor: ColorPallete.lightGray.withOpacity(0.7),
      loop: 50,
      child: child,
    );
  }
}
