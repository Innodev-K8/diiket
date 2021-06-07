import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/custom_exception_message.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderPaymentDetail extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final order = useProvider(activeOrderProvider);
    final orderNotifier = useProvider(activeOrderProvider.notifier);
    final deliveryDetail = useProvider(deliveryDetailProvider);

    final bool isOrderProceed = order != null && order.status != 'unconfirmed';

    final productWeight = (isOrderProceed
            ? order.total_weight!
            : orderNotifier.totalProductWeight) /
        1000;
    final productPrice =
        isOrderProceed ? order.products_price : orderNotifier.totalProductPrice;

    return Container(
      decoration: kBorderedDecoration,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          PaymentDetailRecord(
            title: 'Total berat produk',
            value: Text('$productWeight kg'),
          ),
          SizedBox(height: 16.0),
          PaymentDetailRecord(
            title: 'Total harga produk',
            value: Text('Rp. ${Helper.fmtPrice(productPrice)}'),
          ),
          SizedBox(height: 16.0),
          PaymentDetailRecord(
            title: 'Ongkos kirim',
            value: isOrderProceed
                ? Text(
                    'Rp. ${Helper.fmtPrice(order.delivery_fee)}',
                    textAlign: TextAlign.end,
                  )
                : deliveryDetail.fare?.when(
                      data: (value) => Text(
                        value.delivery_fee != null
                            ? 'Rp. ${Helper.fmtPrice(value.delivery_fee)}'
                            : '-',
                        textAlign: TextAlign.end,
                      ),
                      loading: () => SmallLoading(),
                      error: (error, stackTrace) =>
                          CustomExceptionMessage(error),
                    ) ??
                    Text(
                      '-',
                      textAlign: TextAlign.end,
                    ),
          ),
          SizedBox(height: 16.0),
          PaymentDetailRecord(
            title: 'Ongkos belanja',
            value: isOrderProceed
                ? Text(
                    'Rp. ${Helper.fmtPrice(order.pickup_fee)}',
                    textAlign: TextAlign.end,
                  )
                : deliveryDetail.fare?.when(
                      data: (value) => Text(
                        value.pickup_fee != null
                            ? 'Rp. ${Helper.fmtPrice(value.pickup_fee)}'
                            : '-',
                        textAlign: TextAlign.end,
                      ),
                      loading: () => SmallLoading(),
                      error: (error, stackTrace) =>
                          CustomExceptionMessage(error),
                    ) ??
                    Text(
                      '-',
                      textAlign: TextAlign.end,
                    ),
          ),
          SizedBox(height: 16.0),
          PaymentDetailRecord(
            title: 'Biaya Layanan*',
            value: isOrderProceed
                ? Text(
                    'Rp. ${Helper.fmtPrice(order.service_fee)}',
                    textAlign: TextAlign.end,
                  )
                : deliveryDetail.fare?.when(
                      data: (value) => Text(
                        value.service_fee != null
                            ? 'Rp. ${Helper.fmtPrice(value.service_fee)}'
                            : '-',
                        textAlign: TextAlign.end,
                      ),
                      loading: () => SmallLoading(),
                      error: (error, stackTrace) =>
                          CustomExceptionMessage(error),
                    ) ??
                    Text(
                      '-',
                      textAlign: TextAlign.end,
                    ),
          ),
          SizedBox(height: 16.0),
          DottedLine(
            dashColor: ColorPallete.lightGray,
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Total harga',
                style: kTextTheme.headline6!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              if (isOrderProceed)
                Text(
                  'Rp. ${Helper.fmtPrice(order.total_price)}',
                  textAlign: TextAlign.end,
                  style: kTextTheme.subtitle1!.copyWith(
                    color: ColorPallete.primaryColor,
                    fontSize: 18.0,
                  ),
                )
              else
                deliveryDetail.fare?.when(
                      data: (value) => Text(
                        'Rp. ${Helper.fmtPrice((orderNotifier.totalProductPrice) + (value.total_fee ?? 0))}',
                        textAlign: TextAlign.end,
                        style: kTextTheme.subtitle1!.copyWith(
                          color: ColorPallete.primaryColor,
                          fontSize: 18.0,
                        ),
                      ),
                      loading: () => SmallLoading(),
                      error: (error, stackTrace) =>
                          CustomExceptionMessage(error),
                    ) ??
                    Text(
                      '-',
                      textAlign: TextAlign.end,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentDetailRecord extends StatelessWidget {
  final String title;
  final Widget value;

  const PaymentDetailRecord({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kTextTheme.subtitle2!.copyWith(
            color: ColorPallete.darkGray,
          ),
        ),
        value is Text
            ? Text(
                (value as Text).data ?? '',
                style: (value as Text).style,
                textAlign: TextAlign.end,
              )
            : value
      ],
    );
  }
}

class SmallLoading extends StatelessWidget {
  const SmallLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: CircularProgressIndicator(
        color: ColorPallete.secondaryColor,
        strokeWidth: 2,
      ),
    );
  }
}
