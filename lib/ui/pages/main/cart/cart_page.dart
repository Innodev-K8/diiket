import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/cart/states/confirmed_state_page.dart';
import 'package:diiket/ui/pages/main/cart/states/delivering_state_page.dart';
import 'package:diiket/ui/pages/main/cart/states/empty_state_page.dart';
import 'package:diiket/ui/pages/main/cart/states/guest_state_page.dart';
import 'package:diiket/ui/pages/main/cart/states/purcashing_state_page.dart';
import 'package:diiket/ui/pages/main/cart/states/unconfirmed_state_page.dart';
import 'package:diiket/ui/widgets/auth_wrapper.dart';
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

    return ProviderListener(
      provider: activeOrderErrorProvider,
      onChange: (context, StateController<CustomException?> value) {
        if (value.state != null) {
          Utils.alert(context, value.state!.message ?? 'Terjadi Kesalahan');
        }
      },
      child: SafeArea(
        child: Container(
          color: ColorPallete.backgroundColor,
          alignment: Alignment.center,
          child: AuthWrapper(
            auth: (_) => OrderStateWrapper(
              unconfirmed: (order) => UnconfirmedStatePage(order: order),
              waiting: (order) => ConfirmedStatePage(order: order),
              purchasing: (order) => PurcashingStatePage(order: order),
              delivering: (order) => DeliveringStatePage(order: order),
              empty: () => EmptyStatePage(),
            ),
            guest: GuestStatePage(),
          ),
        ),
      ),
    );
  }
}
