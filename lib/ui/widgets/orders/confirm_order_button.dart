import 'package:diiket/ui/common/helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ConfirmOrderButton extends HookWidget {
  static const double height = 52.0;

  final int price;

  const ConfirmOrderButton({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Text(
              'Rp. ' + Helper.fmtPrice(price),
              style: kTextTheme.button!.copyWith(
                color: ColorPallete.backgroundColor,
              ),
            ),
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
