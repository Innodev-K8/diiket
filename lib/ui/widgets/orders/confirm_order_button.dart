import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/common/custom_exception_message.dart';
import 'package:diiket/ui/widgets/inputs/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'order_payment_detail.dart';

class ConfirmOrderButton extends HookWidget {
  static const double height = 52.0;

  final void Function()? onPressed;

  const ConfirmOrderButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderNotifier = useProvider(activeOrderProvider.notifier);
    final deliveryDetail = useProvider(deliveryDetailProvider);

    return PrimaryButton(
      trailing: deliveryDetail.fee?.when(
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
      onPressed: onPressed,
      child: Text(
        'Pesan',
        style: kTextTheme.headline6!.copyWith(
          color: ColorPallete.backgroundColor,
        ),
      ),
    );
  }
}
