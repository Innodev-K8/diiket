import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String fileName;
  final String text;
  final Function()? onTap;

  const CategoryButton({
    Key? key,
    required this.fileName,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/categories/$fileName.png',
              width: 24,
              height: 24,
              color: ColorPallete.categoryColor,
            ),
            SizedBox(
              height: 12,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
