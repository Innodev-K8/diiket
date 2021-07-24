// TODO: move this  to widget/history
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/providers/order/order_history_provider.dart';
import 'package:diiket/ui/common/helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/history/historu_list_item.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryList extends HookWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final historyState = useProvider(orderHistoryProvider);

    return historyState.maybeWhen(
      data: (orders) =>
          orders.isEmpty ? _buildEmpty() : _buildList(context, orders),
      orElse: () => Text('ntar  bang'),
    );
  }

  Widget _buildList(BuildContext context, List<Order> orders) {
    return RefreshIndicator(
      onRefresh: () =>
          context.read(orderHistoryProvider.notifier).retrieveOrderHistory(),
      child: ListView.separated(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final Order order = orders[index];
          final List<OrderItem> orderItems = order.order_items ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pesanan",
                          style: kTextTheme.headline2,
                        ),
                        Text(
                          Helper.getOrderId(order),
                          style: kTextTheme.caption,
                        ),
                      ],
                    ),
                    Text(
                      order.confirmed_at == null
                          ? '-'
                          : Helper.sortDateFormatter
                              .format(order.confirmed_at!),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: orderItems.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                itemBuilder: (context, index) => HistoryListItem(
                  order: order,
                  orderItem: orderItems[index],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => DottedLine(
          dashColor: ColorPallete.lightGray,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_rounded,
            color: ColorPallete.primaryColor,
            size: 48,
          ),
          SizedBox(height: 18),
          Text(
            'Riwayat Kosong',
            style: kTextTheme.headline2,
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Anda belum pernah melakukan pemesanan apapun',
              textAlign: TextAlign.center,
              style: kTextTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
