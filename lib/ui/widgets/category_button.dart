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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: onTap,
          child: Container(
            height: 72.0,
            width: 72.0,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: ColorPallete.deadColor.withOpacity(0.5),
              ),
            ),
            child: Image.asset(
              'assets/images/categories/$fileName.png',
              width: 24,
              height: 24,
              color: ColorPallete.primaryColor,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
