import 'dart:async';
import 'dart:io';

import 'package:diiket/data/credentials.dart';
import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/models/product_category.dart';
import 'package:diiket/data/models/seller.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/data/notification/background_fcm.dart';
import 'package:diiket/data/notification/service.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/data/providers/global_exception_provider.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/secure_storage.dart';
import 'package:diiket/data/services/dynamic_link_service.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:diiket/ui/pages/main/main_page.dart';
import 'package:diiket/ui/pages/main/profile/settings/name_setting_page.dart';
import 'package:diiket/ui/pages/main/profile/settings/phone_number_setting_page.dart';
import 'package:diiket/ui/pages/main/profile/settings/photo_setting_page.dart';
import 'package:diiket/ui/widgets/market/select_market_bottom_sheet.dart';
import 'package:diiket/ui/widgets/modals/no_internet_bottom_sheet.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID');

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
    await RemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
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
    // first thing to do is to check network connectivity
    _checkConnection();

    // setup selected market
    _initializeSelectedMarket();

    // setup service handlers
    NotificationService()
        .initializeNotificationHandler(context)
        .then((streamSubscription) => notificationStream = streamSubscription);

    DynamicLinkService().initializeHandler(context);
  }

  Future<void> _checkConnection() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      await InternetAddress.lookup(
        Uri.parse(Credentials.apiEndpoint).host,
      );
    } on SocketException catch (_) {
      NoInternetBottomSheet.show(Utils.appNav.currentContext!);
    }
  }

  Future<void> _initializeSelectedMarket() async {
    final Market? selectedMarket = await SecureStorage().getSelectedMarket();

    if (selectedMarket == null) {
      await SelectMarketBottomSheet.show(Utils.appNav.currentContext!);
    } else {
      context.read(currentMarketProvider).state = selectedMarket;
    }
  }

  @override
  void dispose() {
    notificationStream?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ProviderListener(
      provider: exceptionProvider,
      onChange: _handleException,
      child: ProviderListener(
        provider: authExceptionProvider,
        onChange: _handleAuthException,
        child: ProviderListener(
          provider: currentMarketProvider,
          onChange: _handleCurrentMarketChange,
          child: MaterialApp(
            title: 'Diiket',
            debugShowCheckedModeBanner: false,
            navigatorKey: Utils.appNav,
            scaffoldMessengerKey: Utils.appScaffoldMessager,
            // TODO: uncomment this
            // builder: (context, child) => StreamChat(
            //   client: context.read(chatClientProvider),
            //   streamChatThemeData: StreamChatThemeData.fromTheme(
            //     ThemeData(
            //       primaryColor: ColorPallete.primaryColor,
            //       accentColor: ColorPallete.secondaryColor,
            //       textTheme: kTextTheme,
            //     ),
            //   ),
            //   child: child,
            // ),
            theme: ThemeData(
              primaryColor: ColorPallete.primaryColor,
              accentColor: ColorPallete.secondaryColor,
              textTheme: kTextTheme,
            ),
            initialRoute: MainPage.route,
            navigatorObservers: [
              FirebaseAnalyticsObserver(
                  analytics: context.read(analyticsProvider)),
            ],
            routes: {
              MainPage.route: (_) => MainPage(),
              RegisterPage.route: (_) => RegisterPage(),
              PhoneNumberSettingPage.route: (_) => PhoneNumberSettingPage(),
              PhotoSettingPage.route: (_) => PhotoSettingPage(),
              NameSettingPage.route: (_) => NameSettingPage(),
              // TODO: uncomment this
              // ChatPage.route: (_) => ChatPage(),
            },
          ),
        ),
      ),
    );
  }

  void _handleException(context, Exception? exception) {
    if (exception == null) return;

    Utils.alert(
      exception is CustomException && exception.message != null
          ? exception.message!
          : 'Terjadi Kesalahan...',
    );
  }

  void _handleAuthException(
      BuildContext context, StateController<CustomException?> value) {
    final exception = value.state;

    if (exception == null) return;

    Utils.alert(
      exception is CustomException && exception.message != null
          ? exception.message!
          : 'Terjadi Kesalahan...',
    );
  }

  Future<void> _handleCurrentMarketChange(
      BuildContext context, StateController<Market?> market) async {
    if (market.state == null) {
      await SelectMarketBottomSheet.show(Utils.appNav.currentContext!);
    }
  }
}
