import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/pages/main/cart/order_item_list.dart';
import 'package:diiket/ui/widgets/order/order_state_wrapper.dart';
import 'package:diiket/ui/widgets/orders/confirm_order_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final order = useProvider(activeOrderProvider);
    final deliveryDetail = useProvider(deliveryDetailProvider);

    useEffect(() {
      // always update order when we open this page
      context.read(activeOrderProvider.notifier).retrieveActiveOrder();
    }, []);

    return SafeArea(
      child: Container(
        color: ColorPallete.backgroundColor,
        child: Column(
          children: [
            _buildAppBar('Keranjang'),
            OrderStateWrapper(
              unconfirmed: (order) => Expanded(
                child: Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async => await context
                          .read(activeOrderProvider.notifier)
                          .retrieveActiveOrder(),
                      child: OrderItemList(order: order),
                    ),
                    if (deliveryDetail.position != null)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                          child: ConfirmOrderButton(),
                        ),
                      )
                  ],
                ),
              ),
              empty: () => Expanded(
                child: Center(
                  child: Text('Keranjang Kosong'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(String labelText) {
    return Container(
      height: 78.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPallete.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: ColorPallete.lightGray.withOpacity(0.5),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '${labelText}',
          style: kTextTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
