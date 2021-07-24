import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/ui/common/helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/painters/circle_painter.dart';
import 'package:diiket/ui/widgets/products/product_photo.dart';
import 'package:flutter/material.dart';

import 'history_order_more_button.dart';

class HistoryListItem extends StatelessWidget {
  final OrderItem orderItem;

  final Order order;

  const HistoryListItem({
    Key? key,
    required this.order,
    required this.orderItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = orderItem.product;
    final totalPrice = (orderItem.quantity ?? 0) * (product?.price ?? 0);

    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ProductPhoto(product: product),
              ),
              SizedBox(width: 15),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product?.name} ${orderItem.quantity} ${product?.quantity_unit}',
                      style: kTextTheme.headline5,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          order.purchase_completed_at == null
                              ? '-'
                              : Helper.sortDateFormatter
                                  .format(order.purchase_completed_at!),
                          style: kTextTheme.overline,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: SizedBox(
                            width: 4,
                            height: 4,
                            child: CustomPaint(
                              painter: CirclePainter(
                                color: ColorPallete.textColor,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          Helper.getOrderStatusMessage(order),
                          style: kTextTheme.overline!.copyWith(
                            color: ColorPallete.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      product?.stall?.name ?? '-',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Divider(),
        Row(
          children: [
            Row(
              children: [
                Text(
                  '${orderItem.quantity} ${product?.quantity_unit}',
                  style: kTextTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: SizedBox(
                    width: 4,
                    height: 4,
                    child: CustomPaint(
                      painter: CirclePainter(
                        color: ColorPallete.textColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  Helper.fmtPrice(totalPrice),
                  style: kTextTheme.headline6,
                ),
              ],
            ),
            Spacer(),
            HistoryOrderMoreButton(orderItem: orderItem),
          ],
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
