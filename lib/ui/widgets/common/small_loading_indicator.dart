import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';

class SmallLoadingIndicator extends StatelessWidget {
  const SmallLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        color: ColorPallete.primaryColor,
        strokeWidth: 3,
      ),
    );
  }
}
