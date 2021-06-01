import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/pages/main/cart/order_payment_detail.dart';
import 'package:diiket/ui/widgets/custom_exception_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmOrderButton extends HookWidget {
  static const double height = 52.0;

  const ConfirmOrderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderNotifier = useProvider(activeOrderProvider.notifier);
    final deliveryDetail = useProvider(deliveryDetailProvider);

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ColorPallete.primaryColor.withOpacity(0.24),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pesan',
              style: kTextTheme.headline6!.copyWith(
                color: ColorPallete.backgroundColor,
              ),
            ),
            deliveryDetail.fare?.when(
                  data: (value) => Text(
                    'Rp. ${Helper.fmtPrice((orderNotifier.totalProductPrice) + (value.total_fee ?? 0))}',
                    style: kTextTheme.button!.copyWith(
                      color: ColorPallete.backgroundColor,
                    ),
                  ),
                  loading: () => SmallLoading(),
                  error: (error, stackTrace) => CustomExceptionMessage(error),
                ) ??
                SizedBox.shrink(),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: ColorPallete.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
