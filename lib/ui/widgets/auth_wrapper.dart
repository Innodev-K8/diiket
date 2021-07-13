import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthWrapper extends HookWidget {
  final Widget Function(User)? auth;
  final Widget Function()? guest;

  final bool isAnimated;

  const AuthWrapper({
    this.auth,
    this.guest,
    this.isAnimated = true,
  });

  @override
  Widget build(BuildContext context) {
    final User? user = useProvider(authProvider);

    final Widget child = user == null
        ? (guest?.call() ?? SizedBox.shrink())
        : (auth?.call(user) ?? SizedBox.shrink());

    if (!isAnimated) {
      return child;
    }

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: child,
    );
  }
}
