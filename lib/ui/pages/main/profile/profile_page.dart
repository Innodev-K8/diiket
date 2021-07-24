import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/profile/settings/name_setting_page.dart';
import 'package:diiket/ui/pages/main/profile/settings/phone_number_setting_page.dart';
import 'package:diiket/ui/pages/main/profile/settings/photo_setting_page.dart';
import 'package:diiket/ui/widgets/auth/auth_wrapper.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
import 'package:diiket/ui/widgets/auth/login_to_continue_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(title: 'Profil'),
          Expanded(
            child: AuthWrapper(
              isAnimated: false,
              guest: () => LoginToContinueScreen(),
              auth: (_) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: AuthWrapper(
                    auth: (user) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 72 / 2,
                              foregroundImage: (user.profile_picture_url != null
                                  ? CachedNetworkImageProvider(
                                      user.profile_picture_url!,
                                    )
                                  : AssetImage(
                                      'assets/images/placeholders/profile.jpg',
                                    )) as ImageProvider,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.name ?? '-',
                                    style: kTextTheme.headline2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    user.phone_number ?? '-',
                                    style: kTextTheme.subtitle2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          'Pengaturan',
                          style: kTextTheme.headline2,
                        ),
                        SizedBox(height: 10.0),
                        ListTile(
                          leading: Icon(Icons.phone_android_rounded),
                          title: Text(
                            'Nomor Ponsel',
                            style: kTextTheme.headline6,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 0.0,
                          onTap: () {
                            Utils.appNav.currentState
                                ?.pushNamed(PhoneNumberSettingPage.route);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.camera_alt_outlined),
                          title: Text(
                            'Ubah foto',
                            style: kTextTheme.headline6,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 0.0,
                          onTap: () {
                            Utils.appNav.currentState
                                ?.pushNamed(PhotoSettingPage.route);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.mode_edit_outline_rounded),
                          title: Text(
                            'Ubah nama',
                            style: kTextTheme.headline6,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 0.0,
                          onTap: () {
                            Utils.appNav.currentState
                                ?.pushNamed(NameSettingPage.route);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.exit_to_app_rounded),
                          title: Text(
                            'Logout',
                            style: kTextTheme.headline6,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 0.0,
                          onTap: () {
                            Utils.signOutPrompt(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
