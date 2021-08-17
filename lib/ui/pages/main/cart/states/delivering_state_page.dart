import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/cart/chat/chat_driver_button.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
import 'package:diiket/ui/widgets/orders/driver_detail_banner.dart';
import 'package:diiket/ui/widgets/orders/order_delivery_address_detail.dart';
import 'package:diiket/ui/widgets/orders/order_payment_detail.dart';
import 'package:diiket/ui/widgets/inputs/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveringStatePage extends HookWidget {
  final Order order;

  const DeliveringStatePage({
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
                        title: 'Driver dalam perjalanan, siapkan uang cash',
                        driver: order.driver ?? User(),
                        backgroundColor: ColorPallete.successColor,
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
                            // TODO: uncomment this
                            // ChatDriverButton(),
                            SizedBox(height: 10),
                            PrimaryButton(
                              onPressed: () async {
                                final url = "tel:${order.driver?.phone_number}";

                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  Utils.alert(
                                    'Tidak dapat menghubungi no telepon, ${order.driver?.phone_number}',
                                  );
                                }
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
