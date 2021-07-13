import 'package:diiket/ui/widgets/custom_app_bar.dart';
import 'package:diiket/ui/widgets/login_to_continue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GuestStatePage extends HookWidget {
  const GuestStatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomAppBar(title: 'Keranjang'),
        Expanded(
          child: Center(
            child: LoginToContinueButton(
              text: 'Masuk untuk melanjutkan',
              isLarge: true,
            ),
          ),
        ),
      ],
    );
  }
}
