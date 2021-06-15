import 'dart:async';

import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/models/product_category.dart';
import 'package:diiket/data/models/seller.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/data/notification/background_fcm.dart';
import 'package:diiket/data/notification/channels.dart';
import 'package:diiket/data/notification/service.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/data/providers/main_page_controller_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:diiket/ui/pages/main/main_page.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

    _setupInitialMessage();

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      RemoteNotification? notification = message?.notification;
      AndroidNotification? android = message?.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        NotificationService().instance.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: NotificationChannels.order,
              ),
            );
      }
    });

    notificationStream = FirebaseMessaging.onMessageOpenedApp
        .listen(_handleBackgroundFCMNotification);
  }

  Future<void> _setupInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleBackgroundFCMNotification(initialMessage);
    }
  }

  void _handleBackgroundFCMNotification(RemoteMessage message) {
    if (message.data['type'] == 'order') {
      context.read(mainPageController.notifier).setPage(1);
    }
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
