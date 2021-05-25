import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = useProvider(authProvider);
    final activeOrderState = useProvider(activeOrderProvider);

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ini Profile Page'),
          if (user != null) Text('Logged as ${user.name}'),
          if (user != null)
            CircleAvatar(
              backgroundImage: NetworkImage(user.profile_picture_url ?? ''),
            ),
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
              context.read(activeOrderProvider.notifier).retrieveActiveOrder();
            },
            child: Text('Fetch Active Order'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read(activeOrderProvider.notifier).placeOrderItem(
                    Product(id: 1),
                    2,
                    'Yang banyak pak kuahnya...',
                  );
            },
            child: Text('Place Order'),
          ),
          activeOrderState.when(
            data: (order) => Text(order.toString()),
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
