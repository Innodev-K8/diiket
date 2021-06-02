import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PrimaryButton extends HookWidget {
  static const double height = 52.0;

  final Widget child;
  final Widget? trailing;
  final void Function()? onPressed;

  const PrimaryButton({
    Key? key,
    required this.child,
    this.trailing,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'order-button',
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorPallete.primaryColor.withOpacity(0.24),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: trailing != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              child,
              if (trailing != null) trailing!,
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: ColorPallete.primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
