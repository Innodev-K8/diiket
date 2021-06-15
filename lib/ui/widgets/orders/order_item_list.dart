import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/ui/widgets/products/vertical_scroll_product_list.dart';
import 'package:flutter/material.dart';

class OrderItemList extends StatelessWidget {
  final Order order;
  final Widget? header;
  final Widget? footer;
  final bool readonly;
  final EdgeInsetsGeometry? padding;

  const OrderItemList({
    Key? key,
    required this.order,
    this.header,
    this.footer,
    this.readonly = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalScrollProductList(
      header: header,
      footer: footer,
      readonly: readonly,
      padding: padding,
      entryEnabled: false,
      products: (order.order_items ?? []).map((item) => item.product!).toList(),
      onItemTap: (Product product) async {
        // await context.read(mainPageController.notifier).setPage(0);

        // Utils.homeNav.currentState!.pushNamed(
        //   '/home/stall',
        //   arguments: {
        //     'stall_id': product.stall_id,
        //   },
        // );
      },
    );
  }
}
