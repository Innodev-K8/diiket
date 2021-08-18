import 'package:diiket/data/providers/order/active_order_fee_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/widgets/common/custom_exception_message.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:diiket_core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final activeOrderFee = useProvider(activeOrderFeeProvider);

    return PrimaryButton(
      trailing: activeOrderFee.when(
            data: (value) => Text(
              'Rp. ${FormattingHelper.formatPrice((orderNotifier.totalProductPrice) + (value?.total_fee ?? 0))}',
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
