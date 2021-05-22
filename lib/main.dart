import 'package:diiket/data/models/seller.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:diiket/ui/pages/main/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diiket',
      debugShowCheckedModeBanner: false,
      navigatorKey: Utils.appNav,
      theme: ThemeData(
        primaryColor: ColorPallete.primaryColor,
        accentColor: ColorPallete.accentColor,
        textTheme: kTextTheme,
      ),
      initialRoute: MainPage.route,
      routes: {
        MainPage.route: (_) => MainPage(),
        RegisterPage.route: (_) => RegisterPage(),
      },
    );
  }
}
