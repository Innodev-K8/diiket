import 'package:diiket/ui/common/styles.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

class DiiketLogo extends StatelessWidget {
  const DiiketLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Entry.all(
      child: Container(
        decoration: BoxDecoration(
          border: kBorderedDecoration.border,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(22),
        child: Image.asset(
          'assets/images/splash.png',
          width: 23,
          height: 23,
        ),
      ),
    );
  }
}
