import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
import 'package:diiket/ui/widgets/common/small_loading_indicator.dart';
import 'package:diiket/ui/widgets/orders/order_delivery_address_detail.dart';
import 'package:diiket/ui/widgets/orders/order_item_list.dart';
import 'package:diiket/ui/widgets/orders/order_payment_detail.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// HALAMAN SEDANG MENCARI DRIVER

class ConfirmedStatePage extends HookWidget {
  final Order order;

  const ConfirmedStatePage({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);

    final isMounted = useIsMounted();

    return Column(
      children: [
        CustomAppBar(title: 'Menunggu Driver'),
        Expanded(
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async => context
                    .read(activeOrderProvider.notifier)
                    .retrieveActiveOrder(),
                child: OrderItemList(
                  readonly: true,
                  padding: const EdgeInsets.fromLTRB(
                    24.0,
                    10.0,
                    24.0,
                    20.0,
                  ),
                  header: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons/two-wheeler-black.png',
                        color: ColorPallete.primaryColor,
                        width: 32,
                        height: 32,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Text(
                        'Menunggu driver',
                      ),),
                      SizedBox(width: 20),
                      Container(
                        decoration: kBorderedDecoration,
                        padding: const EdgeInsets.all(16.0),
                        child: SmallLoadingIndicator(),
                      ),
                    ],
                  ),
                  order: order,
                  footer: Column(
                    children: [
                      OrderDeliveryAddressDetail(),
                      SizedBox(height: 10.0),
                      OrderPaymentDetail(),
                      SizedBox(height: 10.0),
                      PrimaryButton(
                        color: ColorPallete.darkGray,
                        onPressed: () async {
                          isLoading.value = true;

                          await context
                              .read(activeOrderProvider.notifier)
                              .cancelActiveOrder();

                          if (isMounted()) {
                            isLoading.value = false;
                          }
                        },
                        child: Text('Batalkan Pesanan'),
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
