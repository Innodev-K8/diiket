import 'package:diiket/ui/widgets/history/historu_list_item.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  final List<Order> orders;

  const HistoryList({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return orders.isEmpty ? _buildEmpty() : _buildList();
  }

  ListView _buildList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
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
                        style: kTextTheme.headline1,
                      ),
                      Text(
                        MessageHelper.getOrderId(order),
                        style: kTextTheme.caption,
                      ),
                    ],
                  ),
                  Text(
                    order.confirmed_at == null
                        ? '-'
                        : FormattingHelper.sortDate.format(order.confirmed_at!),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: orderItems.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
