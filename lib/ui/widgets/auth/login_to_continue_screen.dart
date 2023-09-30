import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:diiket_core/diiket_core.dart';
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
          onPressed: () {
            Utils.appNav.currentState?.pushNamed(RegisterPage.route);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorPallete.primaryColor,
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
          style: kTextTheme.bodySmall,
        ),
      ],
    );
  }
}
