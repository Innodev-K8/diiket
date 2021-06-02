import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/cart/alerts/checkout_success.dart';
import 'package:diiket/ui/pages/main/cart/order_payment_detail.dart';
import 'package:diiket/ui/widgets/custom_exception_message.dart';
import 'package:diiket/ui/widgets/orders/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class ConfirmOrderButton extends HookWidget {
  static const double height = 52.0;

  const ConfirmOrderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderNotifier = useProvider(activeOrderProvider.notifier);
    final deliveryDetail = useProvider(deliveryDetailProvider);

    return PrimaryButton(
      child: Text(
        'Pesan',
        style: kTextTheme.headline6!.copyWith(
          color: ColorPallete.backgroundColor,
        ),
      ),
      trailing: deliveryDetail.fare?.when(
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
      onPressed: () {
        HapticFeedback.vibrate();

        Utils.appNav.currentState?.push(
          PageTransition(
            child: CheckoutSuccessPage(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            curve: Curves.easeInOutQuart,
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
