import 'package:diiket/data/providers/order/active_order_fee_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/widgets/common/custom_exception_message.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderPaymentDetail extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final order = useProvider(activeOrderProvider);
    final orderNotifier = useProvider(activeOrderProvider.notifier);
    final activeOrderFee = useProvider(activeOrderFeeProvider);

    final bool isOrderProceed =
        order != null && order.status != OrderStatus.unconfirmed;

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
            value: Text('Rp. ${FormattingHelper.formatPrice(productPrice)}'),
          ),
          SizedBox(height: 16.0),
          PaymentDetailRecord(
            title: 'Ongkos kirim',
            value: isOrderProceed
                ? Text(
                    'Rp. ${FormattingHelper.formatPrice(order.delivery_fee)}',
                    textAlign: TextAlign.end,
                  )
                : activeOrderFee.when(
                      data: (value) => Text(
                        value?.delivery_fee != null
                            ? 'Rp. ${FormattingHelper.formatPrice(value?.delivery_fee)}'
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
                    'Rp. ${FormattingHelper.formatPrice(order.pickup_fee)}',
                    textAlign: TextAlign.end,
                  )
                : activeOrderFee.when(
                      data: (value) => Text(
                        value?.pickup_fee != null
                            ? 'Rp. ${FormattingHelper.formatPrice(value?.pickup_fee)}'
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
                    'Rp. ${FormattingHelper.formatPrice(order.service_fee)}',
                    textAlign: TextAlign.end,
                  )
                : activeOrderFee.when(
                      data: (value) => Text(
                        value?.service_fee != null
                            ? 'Rp. ${FormattingHelper.formatPrice(value?.service_fee)}'
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
            children: [
              Text(
                'Total harga',
                style: kTextTheme.titleLarge!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              if (isOrderProceed)
                Text(
                  'Rp. ${FormattingHelper.formatPrice(order.total_price)}',
                  textAlign: TextAlign.end,
                  style: kTextTheme.titleMedium!.copyWith(
                    color: ColorPallete.primaryColor,
                    fontSize: 18.0,
                  ),
                )
              else
                activeOrderFee.when(
                      data: (value) => Text(
                        'Rp. ${FormattingHelper.formatPrice((orderNotifier.totalProductPrice) + (value?.total_fee ?? 0))}',
                        textAlign: TextAlign.end,
                        style: kTextTheme.titleMedium!.copyWith(
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
          style: kTextTheme.titleSmall!.copyWith(
            color: ColorPallete.darkGray,
          ),
        ),
        if (value is Text)
          Text(
            (value as Text).data ?? '',
            style: (value as Text).style,
            textAlign: TextAlign.end,
          )
        else
          value,
      ],
    );
  }
}
