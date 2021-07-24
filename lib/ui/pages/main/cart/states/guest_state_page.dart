import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/custom_app_bar.dart';
import 'package:diiket/ui/widgets/auth/login_to_continue_screen.dart';
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
          child: LoginToContinueScreen(),
        ),
      ],
    );
  }
}
