import 'package:diiket/data/models/user.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

class DriverDetailBanner extends StatelessWidget {
  final User driver;
  final String? title;
  final Color? backgroundColor;

  const DriverDetailBanner(
      {Key? key, required this.driver, this.title, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    foregroundImage:
                        NetworkImage(driver.profile_picture_url ?? ''),
                    radius: 72 / 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        driver.driver_detail?.vehicle_name ?? '-',
                        style: kTextTheme.overline,
                      ),
                      Text(
                        driver.driver_detail?.vehicle_number ?? '-',
                        style: kTextTheme.headline3,
                      ),
                      SizedBox(height: 8),
                      Text(
                        driver.name ?? '-',
                        style: kTextTheme.bodyText2!.copyWith(
                          color: backgroundColor ?? ColorPallete.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 56.0,
            alignment: Alignment.center,
            color: backgroundColor ?? ColorPallete.secondaryColor,
            child: Text(
              title ?? '',
              style: kTextTheme.bodyText2!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
