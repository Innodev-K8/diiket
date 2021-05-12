import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String fileName;
  final String text;

  const CategoryButton({Key? key, required this.fileName, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
    );
  }
}
