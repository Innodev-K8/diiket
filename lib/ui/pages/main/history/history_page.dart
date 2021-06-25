import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.design_services_rounded,
              color: ColorPallete.primaryColor,
              size: 48,
            ),
            SizedBox(height: 18),
            Text(
              'Akan Datang',
              style: kTextTheme.headline4,
            ),
            SizedBox(height: 6),
            Text(
              'Fitur ini masih belum tersedia, tunggu update-update berikutnya ya!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
