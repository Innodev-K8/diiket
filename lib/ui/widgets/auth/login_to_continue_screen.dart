import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

class LoginToContinueScreen extends StatelessWidget {
  const LoginToContinueScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: ColorPallete.primaryColor,
            shadowColor: ColorPallete.primaryColor.withOpacity(0.5),
            elevation: 6,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text('Masuk'),
        ),
        SizedBox(height: 5),
        Text(
          'Masuk untuk melanjutkan',
          style: kTextTheme.caption,
        ),
      ],
    );
  }
}
