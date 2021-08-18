import 'package:diiket/ui/widgets/common/loading.dart';
import 'package:diiket/ui/widgets/history/historu_list_item.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class HistoryListLoading extends StatelessWidget {
  const HistoryListLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Loading(
      child: ListView.separated(
        itemCount: 2,
        itemBuilder: (context, index) {
          final Order order = Order();
          final List<OrderItem> orderItems =
              List.generate(5, (index) => OrderItem());

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: 80,
                      height: 10,
                      color: Colors.grey,
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
                  isLoading: true,
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
}
