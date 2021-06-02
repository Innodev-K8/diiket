import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/orders/primary_button.dart';
import 'package:flutter/material.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundColor,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Hero(
                    tag: 'order-button',
                    child: Image.asset(
                      'assets/images/icons/cart-check.png',
                      color: ColorPallete.primaryColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Berhasil',
                    style: kTextTheme.headline3,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pembayaran pesanan dilakukan di tempat (COD)',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 54),
            PrimaryButton(
              child: Text('Kembali ke pesanan'),
              onPressed: () {
                Utils.appNav.currentState?.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
