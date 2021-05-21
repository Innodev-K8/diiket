import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ini Profile Page'),
          ElevatedButton(
            onPressed: () {
              Utils.appNav.currentState?.pushNamed(RegisterPage.route);
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
