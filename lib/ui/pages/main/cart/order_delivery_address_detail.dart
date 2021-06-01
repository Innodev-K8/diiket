import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderDeliveryAddressDetail extends HookWidget {
  const OrderDeliveryAddressDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Titik Antar',
                  style: kTextTheme.subtitle2!.copyWith(
                    color: ColorPallete.darkGray,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  deliveryDetail.geocodedPosition ?? '-',
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          // SizedBox(height: 16),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Catatan Alamat',
          //       style: kTextTheme.subtitle2!.copyWith(
          //         color: ColorPallete.darkGray,
          //       ),
          //     ),
          //     Text(
          //       order?.address ?? '-',
          //       textAlign: TextAlign.end,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
