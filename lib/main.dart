import 'dart:async';

import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/models/product_category.dart';
import 'package:diiket/data/models/seller.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/data/notification/background_fcm.dart';
import 'package:diiket/data/notification/service.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:diiket/ui/pages/main/main_page.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Hive.initFlutter();
  await NotificationService().initialize();

  Hive.registerAdapter(StallAdapter());
  Hive.registerAdapter(SellerAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ProductCategoryAdapter());

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  await RemoteConfig.instance.fetchAndActivate();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? notificationStream;

  @override
  void initState() {
    super.initState();

    NotificationService()
        .initializeNotificationHandler(context)
        .then((streamSubscription) => notificationStream = streamSubscription);
  }

  @override
  void dispose() {
    notificationStream?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diiket',
      debugShowCheckedModeBanner: false,
      navigatorKey: Utils.appNav,
      theme: ThemeData(
        primaryColor: ColorPallete.primaryColor,
        accentColor: ColorPallete.secondaryColor,
        textTheme: kTextTheme,
      ),
      initialRoute: MainPage.route,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: context.read(analyticsProvider)),
      ],
      routes: {
        MainPage.route: (_) => MainPage(),
        RegisterPage.route: (_) => RegisterPage(),
      },
    );
  }
}
