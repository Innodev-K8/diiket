import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/fare.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/cart/alerts/checkout_success.dart';
import 'package:diiket/ui/widgets/custom_app_bar.dart';
import 'package:diiket/ui/widgets/orders/confirm_order_button.dart';
import 'package:diiket/ui/widgets/orders/order_delivery_address_detail.dart';
import 'package:diiket/ui/widgets/orders/order_item_list.dart';
import 'package:diiket/ui/widgets/orders/order_payment_detail.dart';
import 'package:diiket/ui/widgets/orders/select_order_delivery_location_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    final deliveryDetail = useProvider(deliveryDetailProvider);
    final isLoading = useState<bool>(false);

    return Column(
      children: [
        CustomAppBar(title: 'Keranjang'),
        Expanded(
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async => await context
                    .read(activeOrderProvider.notifier)
                    .retrieveActiveOrder(),
                child: OrderItemList(
                  padding: const EdgeInsets.fromLTRB(
                    24.0,
                    10.0,
                    24.0,
                    ConfirmOrderButton.height + 20,
                  ),
                  header: Column(
                    children: [
                      SelectOrderDeliveryLocationButton(
                        onLoading: () => isLoading.value = true,
                        onDone: () => isLoading.value = false,
                      ),
                      SizedBox(height: 10),
                      OrderDeliveryAddressDetail(),
                      SizedBox(height: 20.0),
                    ],
                  ),
                  order: order,
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: OrderPaymentDetail(),
                  ),
                ),
              ),
              if (deliveryDetail.position != null)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                    child: ConfirmOrderButton(
                      onPressed: () async {
                        Fare? fare = deliveryDetail.fare?.data?.value;
                        LatLng? position = deliveryDetail.position;
                        String? notificationToken =
                            await FirebaseMessaging.instance.getToken();

                        if (fare == null || position == null) return;

                        isLoading.value = true;

                        HapticFeedback.vibrate();

                        try {
                          await context
                              .read(activeOrderProvider.notifier)
                              .confirmActiveOrder(
                                position,
                                fare,
                                deliveryDetail.geocodedPosition,
                                notificationToken,
                                onComplete: () async =>
                                    await Utils.appNav.currentState?.push(
                                  PageTransition(
                                    child: CheckoutSuccessPage(),
                                    type: PageTransitionType.scale,
                                    alignment: Alignment.bottomCenter,
                                    curve: Curves.easeInOutQuart,
                                    duration: Duration(seconds: 1),
                                  ),
                                ),
                              );
                        } on CustomException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.message ?? 'Terjadi kesalahan'),
                              duration: Duration(seconds: 4),
                            ),
                          );
                        } finally {
                          isLoading.value = false;
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
}
