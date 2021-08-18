import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';

class LoginToContinueButton extends StatelessWidget {
  final String text;
  final bool isLarge;

  const LoginToContinueButton({
    Key? key,
    this.text = 'Masuk untuk order.',
    this.isLarge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isLarge ? 38.0 : 28.0,
      child: ElevatedButton.icon(
        onPressed: () {
          Utils.appNav.currentState?.pushNamed(RegisterPage.route);
        },
        icon: Icon(
          Icons.login_rounded,
          size: isLarge ? 14.0 : 10.0,
        ),
        label: Text(
          text,
          style: kTextTheme.button!.copyWith(
            fontSize: isLarge ? 14.0 : 10.0,
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
