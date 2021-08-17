import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/inputs/primary_button.dart';
import 'package:flutter/material.dart';

class Wip extends StatelessWidget {
  const Wip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: 12),
        SizedBox(
          width: 120,
          height: 43,
          child: PrimaryButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Kembali'),
          ),
        ),
      ],
    );
  }
}
