import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/pages/main/cart/states/confirmed_state_page.dart';
import 'package:diiket/ui/pages/main/cart/states/delivering_state_page.dart';
import 'package:diiket/ui/pages/main/cart/states/purcashing_state_page.dart';
import 'package:diiket/ui/pages/main/cart/states/unconfirmed_state_page.dart';
import 'package:diiket/ui/widgets/auth_wrapper.dart';
import 'package:diiket/ui/widgets/login_to_continue_button.dart';
import 'package:diiket/ui/widgets/orders/order_state_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // always update order when we open this page
      context.read(activeOrderProvider.notifier).retrieveActiveOrder();
    }, []);

    return SafeArea(
      child: Container(
        color: ColorPallete.backgroundColor,
        alignment: Alignment.center,
        child: AuthWrapper(
          auth: (_) => OrderStateWrapper(
            unconfirmed: (order) => UnconfirmedStatePage(order: order),
            waiting: (order) => ConfirmedStatePage(order: order),
            purchasing: (order) => PurcashingStatePage(order: order),
            delivering: (order) => DeliveringStatePage(order: order),
            empty: () => Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart_outlined,
                    color: ColorPallete.primaryColor,
                    size: 48,
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Keranjang Kosong',
                    style: kTextTheme.headline4,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Tambahkan barang ke keranjang untuk melanjutkan',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          guest: Center(
            child: LoginToContinueButton(
              text: 'Masuk untuk melanjutkan',
            ),
          ),
        ),
      ),
    );
  }
}
