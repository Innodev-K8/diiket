import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/products/popular_products_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = useProvider(authProvider);
    final productsState = useProvider(productProvider('test'));

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ini Profile Page'),
          if (user != null) Text('Logged as ${user.name}'),
          if (user != null)
            ElevatedButton(
              onPressed: () {
                context.read(authProvider.notifier).signOut();
              },
              child: Text('Sign Out'),
            )
          else
            ElevatedButton(
              onPressed: () {
                Utils.appNav.currentState?.pushNamed(RegisterPage.route);
              },
              child: Text('Login'),
            ),
          ElevatedButton(
            onPressed: () {
              context.read(productProvider('test').notifier).loadProducts();
            },
            child: Text('Fetch Product'),
          ),
          productsState.when(
            data: (value) => Text(value.first.toString()),
            loading: () => Text('loading'),
            error: (error, stackTrace) => Text(
              error.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
