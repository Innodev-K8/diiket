import 'package:diiket/ui/painters/circle_painter.dart';
import 'package:diiket/ui/widgets/products/product_photo.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';

import 'history_order_more_button.dart';

class HistoryListItem extends StatelessWidget {
  final Order order;
  final OrderItem orderItem;

  final bool isLoading;

  const HistoryListItem({
    Key? key,
    required this.order,
    required this.orderItem,
    this.isLoading = false,
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
                    if (isLoading)
                      Container(
                        width: 100,
                        height: 20,
                        color: Colors.grey,
                      )
                    else
                      Text(
                        '${product?.name} ${orderItem.quantity} ${product?.quantity_unit}',
                        style: kTextTheme.headline5,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    SizedBox(height: 5),
                    if (isLoading)
                      Container(
                        width: 150,
                        height: 10,
                        color: Colors.grey,
                      )
                    else
                    Row(
                      children: [
                        Text(
                          order.purchase_completed_at == null
                              ? '-'
                              : FormattingHelper.sortDate
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
                          MessageHelper.getOrderStatusMessage(order),
                          style: kTextTheme.overline!.copyWith(
                            color: ColorPallete.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    if (isLoading)
                      Container(
                        width: 18,
                        height: 10,
                        color: Colors.grey,
                      )
                    else
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
        Row(
          children: [
            Row(
              children: [
                if (isLoading)
                  Container(
                    width: 50,
                    height: 10,
                    color: Colors.grey,
                  )
                else
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
                if (isLoading)
                  Container(
                    width: 20,
                    height: 10,
                    color: Colors.grey,
                  )
                else
                Text(
                  FormattingHelper.formatPrice(totalPrice),
                  style: kTextTheme.headline6,
                ),
              ],
            ),
            Spacer(),
            if (isLoading)
              Container(
                width: 100,
                height: 30,
                color: Colors.grey,
              )
            else
            HistoryOrderMoreButton(orderItem: orderItem),
          ],
        ),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 12),
      ],
    );
  }
}
