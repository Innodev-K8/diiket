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
    final orderNotifier = useProvider(activeOrderProvider.notifier);
    final deliveryDetail = useProvider(deliveryDetailProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorPallete.lightGray.withOpacity(0.5),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total berat produk',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              Text(
                '${(orderNotifier.totalProductWeight) / 1000} kg',
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total harga produk',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              Text(
                'Rp. ${Helper.fmtPrice(orderNotifier.totalProductPrice)}',
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ongkos kirim',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              deliveryDetail.fare?.when(
                    data: (value) => Text(
                      value.delivery_fee != null
                          ? 'Rp. ${Helper.fmtPrice(value.delivery_fee)}'
                          : '-',
                      textAlign: TextAlign.end,
                    ),
                    loading: () => SmallLoading(),
                    error: (error, stackTrace) => CustomExceptionMessage(error),
                  ) ??
                  Text(
                    '-',
                    textAlign: TextAlign.end,
                  ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ongkos belanja',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              deliveryDetail.fare?.when(
                    data: (value) => Text(
                      value.pickup_fee != null
                          ? 'Rp. ${Helper.fmtPrice(value.pickup_fee)}'
                          : '-',
                      textAlign: TextAlign.end,
                    ),
                    loading: () => SmallLoading(),
                    error: (error, stackTrace) => CustomExceptionMessage(error),
                  ) ??
                  Text(
                    '-',
                    textAlign: TextAlign.end,
                  ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Biaya Layanan*',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              deliveryDetail.fare?.when(
                    data: (value) => Text(
                      value.service_fee != null
                          ? 'Rp. ${Helper.fmtPrice(value.service_fee)}'
                          : '-',
                      textAlign: TextAlign.end,
                    ),
                    loading: () => SmallLoading(),
                    error: (error, stackTrace) => CustomExceptionMessage(error),
                  ) ??
                  Text(
                    '-',
                    textAlign: TextAlign.end,
                  ),
            ],
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
                    error: (error, stackTrace) => CustomExceptionMessage(error),
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
