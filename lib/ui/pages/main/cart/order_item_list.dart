import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/main_page_controller_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/cart/order_payment_detail.dart';
import 'package:diiket/ui/widgets/orders/confirm_order_button.dart';
import 'package:diiket/ui/widgets/products/vertical_scroll_product_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'order_delivery_address_detail.dart';
import 'select_order_delivery_location_button.dart';

class OrderItemList extends StatelessWidget {
  final Order order;

  const OrderItemList({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalScrollProductList(
      header: Column(
        children: [
          SelectOrderDeliveryLocationButton(),
          SizedBox(height: 10),
          OrderDeliveryAddressDetail(),
          SizedBox(height: 20.0),
        ],
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: OrderPaymentDetail(),
      ),
      padding: const EdgeInsets.fromLTRB(
        24.0,
        10.0,
        24.0,
        ConfirmOrderButton.height + 20,
      ),
      products: (order.order_items ?? []).map((item) => item.product!).toList(),
      onItemTap: (Product product) async {
        await context.read(mainPageController.notifier).setPage(0);

        Utils.homeNav.currentState!.pushNamed(
          '/home/stall',
          arguments: {
            'stall_id': product.stall_id,
          },
        );
      },
    );
  }
}
