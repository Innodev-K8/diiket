import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;

  const SimpleButton({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.0,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          elevation: 0,
          primary: ColorPallete.blueishGray,
        ),
        child: child,
      ),
    );
  }
}
