import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
import 'package:diiket/ui/widgets/orders/order_delivery_address_detail.dart';
import 'package:diiket/ui/widgets/orders/select_order_delivery_location_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EmptyStatePage extends HookWidget {
  const EmptyStatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Keranjang'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SelectOrderDeliveryLocationButton(),
                SizedBox(height: 10),
                OrderDeliveryAddressDetail(),
                SizedBox(height: 20.0),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_shopping_cart_outlined,
                          color: ColorPallete.primaryColor,
                          size: 48,
                        ),
                        SizedBox(height: 18),
                        Text(
                          'Keranjang Kosong',
                          style: kTextTheme.headline4,
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Tambahkan barang ke keranjang untuk melanjutkan',
                          textAlign: TextAlign.center,
                          style: kTextTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
