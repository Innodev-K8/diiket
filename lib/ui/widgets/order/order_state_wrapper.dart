import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderStateWrapper extends HookWidget {
  final Widget Function(Order)? unconfirmed;
  final Widget Function(Order)? waiting;
  final Widget Function(Order)? purchasing;
  final Widget Function(Order)? delivering;
  final Widget Function()? empty;

  OrderStateWrapper({
    this.unconfirmed,
    this.waiting,
    this.purchasing,
    this.delivering,
    this.empty,
  });

  @override
  Widget build(BuildContext context) {
    final order = useProvider(activeOrderProvider);

    Widget? widgetState;

    print(order);

    switch (order?.status) {
      case 'unconfirmed':
        widgetState = unconfirmed?.call(order!);
        break;
      case 'waiting':
        widgetState = waiting?.call(order!);
        break;
      case 'purchasing':
        widgetState = purchasing?.call(order!);
        break;
      case 'delivering':
        widgetState = delivering?.call(order!);
        break;
      default:
        widgetState = empty?.call();
    }

    return widgetState ?? SizedBox.shrink();
  }
}
