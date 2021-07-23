import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/chat/chat_channel_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/cart/chat/chat_page.dart';
import 'package:diiket/ui/widgets/custom_app_bar.dart';
import 'package:diiket/ui/widgets/orders/driver_detail_banner.dart';
import 'package:diiket/ui/widgets/orders/order_delivery_address_detail.dart';
import 'package:diiket/ui/widgets/orders/order_payment_detail.dart';
import 'package:diiket/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class PurcashingStatePage extends HookWidget {
  final Order order;

  const PurcashingStatePage({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);

    return Column(
      children: [
        CustomAppBar(title: 'Detail Pesanan'),
        Expanded(
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async => context
                    .read(activeOrderProvider.notifier)
                    .retrieveActiveOrder(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DriverDetailBanner(
                        title: 'Driver membeli pesanan',
                        driver: order.driver ?? User(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          24.0,
                          20.0,
                          24.0,
                          24.0,
                        ),
                        child: Column(
                          children: [
                            OrderDeliveryAddressDetail(),
                            SizedBox(height: 10),
                            OrderPaymentDetail(),
                            SizedBox(height: 10),
                            PrimaryButton(
                              onPressed: () async {
                                final user = context.read(authProvider);

                                await context
                                    .read(orderChatChannelProvider.notifier)
                                    .connect(
                                      channelId:
                                          'market-${order.market_id}-orders-${order.id}',
                                      userToken:
                                          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNyJ9.d9v1k_Xd9YNRbMKOIsULEB9K3aX6IgoUSm8Xt3_lzZ8',
                                      user: user!.copyWith(id: 7),
                                    );

                                Utils.appNav.currentState
                                    ?.pushNamed(ChatPage.route);

                                // final url = "tel:${order.driver?.phone_number}";

                                // if (await canLaunch(url)) {
                                //   await launch(url);
                                // } else {
                                //   Utils.alert(
                                //     'Tidak dapat menghubungi no telepon, ${order.driver?.phone_number}',
                                //   );
                                // }
                              },
                              child: Text('Hubungi Driver'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isLoading.value)
                Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.7),
                  child: CircularProgressIndicator(
                    color: ColorPallete.primaryColor,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
