import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:flutter/material.dart';

class LoginToContinueButton extends StatelessWidget {
  final String text;
  const LoginToContinueButton({
    Key? key,
    this.text = 'Masuk untuk order.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.0,
      child: ElevatedButton(
        onPressed: () {
          Utils.appNav.currentState?.pushNamed(RegisterPage.route);
        },
        child: Text(
          text,
          style: kTextTheme.button!.copyWith(
            fontSize: 10.0,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          elevation: 0,
          primary: ColorPallete.primaryColor,
        ),
      ),
    );
  }
}
