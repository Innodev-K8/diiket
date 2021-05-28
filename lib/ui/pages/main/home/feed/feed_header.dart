import 'package:diiket/ui/common/helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:diiket/ui/widgets/auth_wrapper.dart';
import 'package:flutter/material.dart';

class FeedHeader extends StatelessWidget {
  const FeedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 28.0, 24.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthWrapper(
                auth: (user) => Text('Hai, ${user.name ?? Helper.greeting()}'),
                guest: Text('Hai, ${Helper.greeting()}'),
              ),
              Text(
                'Cari Sesuatu?',
                style: kTextTheme.headline2,
              ),
            ],
          ),
          AuthWrapper(
            auth: (user) => CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(user.profile_picture_url ?? ''),
            ),
            guest: OutlinedButton(
              onPressed: () {
                Utils.appNav.currentState?.pushNamed(RegisterPage.route);
              },
              child: Text(
                'Masuk',
                style: kTextTheme.button!.copyWith(
                  color: ColorPallete.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
