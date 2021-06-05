import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/fare.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/cart/alerts/checkout_success.dart';
import 'package:diiket/ui/widgets/orders/confirm_order_button.dart';
import 'package:diiket/ui/widgets/orders/order_delivery_address_detail.dart';
import 'package:diiket/ui/widgets/orders/order_item_list.dart';
import 'package:diiket/ui/widgets/orders/order_payment_detail.dart';
import 'package:diiket/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class ConfirmedStatePage extends HookWidget {
  final Order order;

  const ConfirmedStatePage({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);

    return Expanded(
      child: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async => await context
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
                    'Mencari driver',
                  )),
                  SizedBox(width: 20),
                  Container(
                    decoration: kBorderedDecoration,
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: ColorPallete.primaryColor,
                        strokeWidth: 3,
                      ),
                    ),
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
                    child: Text('Batalkan Pesanan'),
                    color: ColorPallete.darkGray,
                    onPressed: () {},
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
    );
  }
}
