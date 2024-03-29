import 'package:diiket/ui/common/utils.dart';
import 'package:diiket_core/diiket_core.dart';
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
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/icons/cart-check.png',
                    color: ColorPallete.primaryColor,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Berhasil',
                    style: kTextTheme.headline3,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pesananmu akan kami teruskan ke driver dengan pembayaran dilakukan di tempat (COD)',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 54),
            PrimaryButton(
              onPressed: () {
                Utils.appNav.currentState?.pop();
              },
              child: Text('Kembali ke pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
