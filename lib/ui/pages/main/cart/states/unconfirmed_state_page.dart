import 'package:diiket/data/providers/order/active_order_fee_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/cart/alerts/checkout_success.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
import 'package:diiket/ui/widgets/orders/confirm_order_button.dart';
import 'package:diiket/ui/widgets/orders/order_delivery_address_detail.dart';
import 'package:diiket/ui/widgets/orders/order_item_list.dart';
import 'package:diiket/ui/widgets/orders/order_payment_detail.dart';
import 'package:diiket/ui/widgets/orders/select_order_delivery_location_button.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class UnconfirmedStatePage extends HookWidget {
  final Order order;

  const UnconfirmedStatePage({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deliveryDetail = useProvider(deliveryDetailProvider).state;
    final activeOrderFee = useProvider(activeOrderFeeProvider);

    final isLoading = useState<bool>(false);

    final isMounted = useIsMounted();

    // make sure that the LatLng position is not null before proceeding
    final isOrderButtonVisible = deliveryDetail?.position != null;

    return Column(
      children: [
        CustomAppBar(title: 'Keranjang'),
        Expanded(
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async => context
                    .read(activeOrderProvider.notifier)
                    .retrieveActiveOrder(),
                child: OrderItemList(
                  padding: EdgeInsets.fromLTRB(
                    24.0,
                    10.0,
                    24.0,
                    isOrderButtonVisible ? ConfirmOrderButton.height + 20 : 10,
                  ),
                  header: Column(
                    children: [
                      SelectOrderDeliveryLocationButton(
                        onLoading: () => isLoading.value = true,
                        onDone: () => isLoading.value = false,
                      ),
                      SizedBox(height: 10),
                      if (deliveryDetail != null) ...[
                        OrderDeliveryAddressDetail(),
                        SizedBox(height: 20.0),
                      ],
                    ],
                  ),
                  order: order,
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: OrderPaymentDetail(),
                  ),
                ),
              ),
              if (isOrderButtonVisible)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                    child: ConfirmOrderButton(
                      onPressed: () async {
                        final fee = activeOrderFee.maybeWhen(
                          data: (fee) => fee,
                          orElse: () => null,
                        );

                        // TODO: remove this when implementing user notification
                        final String? notificationToken =
                            await FirebaseMessaging.instance.getToken();

                        // stop if delivery detail and fee is null
                        if (deliveryDetail == null || fee == null) {
                          return;
                        }

                        isLoading.value = true;

                        HapticFeedback.vibrate();

                        try {
                          await context
                              .read(activeOrderProvider.notifier)
                              .confirmActiveOrder(
                                deliveryDetail: deliveryDetail,
                                fee: fee,
                                notificationToken: notificationToken,
                                onConfirmed: _onOrderConfirmed,
                              );
                        } finally {
                          if (isMounted()) {
                            isLoading.value = false;
                          }
                        }
                      },
                    ),
                  ),
                ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: isLoading.value
                    ? Container(
                        alignment: Alignment.center,
                        color: Colors.white.withOpacity(0.7),
                        child: CircularProgressIndicator(
                          color: ColorPallete.primaryColor,
                        ),
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future? _onOrderConfirmed() => Utils.appNav.currentState?.push(
        PageTransition(
          child: CheckoutSuccessPage(),
          type: PageTransitionType.scale,
          alignment: Alignment.bottomCenter,
          curve: Curves.easeInOutQuart,
          duration: Duration(seconds: 1),
        ),
      );
}
