import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? leading;
  final bool showBackButton;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPallete.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: ColorPallete.lightGray.withOpacity(0.5),
          ),
        ),
      ),
      padding: showBackButton
          ? const EdgeInsets.only(left: 24 - 10, right: 24.0)
          : const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          ...?leading,
          if (showBackButton) ...[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 32,
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: kTextTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
