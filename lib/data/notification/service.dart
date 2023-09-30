import 'dart:async';

import 'package:diiket/data/notification/channels.dart';
import 'package:diiket/data/providers/main_page_controller_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationService {
  static NotificationService? _notificationService;

  factory NotificationService() {
    return _notificationService ?? NotificationService._();
  }

  late FlutterLocalNotificationsPlugin instance;

  NotificationService._() {
    instance = FlutterLocalNotificationsPlugin();
  }

  Future<bool?> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await instance
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(NotificationChannels.defaultChannel);

    return instance.initialize(
      initializationSettings,
      onSelectNotification: (payload) async {},
    );
  }

  Future<StreamSubscription<RemoteMessage>> initializeNotificationHandler(
      BuildContext context,) async {
    final RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      // ignore: use_build_context_synchronously
      _handleBackgroundFCMNotification(context, initialMessage);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      final RemoteNotification? notification = message?.notification;
      final AndroidNotification? android = message?.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        NotificationService().instance.show(
              notification.hashCode,
              notification.title,
              notification.body,
              const NotificationDetails(
                android: NotificationChannels.order,
              ),
            );
      }
    });

    return FirebaseMessaging.onMessageOpenedApp.listen(
        (message) => _handleBackgroundFCMNotification(context, message),);
  }

  void _handleBackgroundFCMNotification(
      BuildContext context, RemoteMessage message,) {
    if (message.data['type'] == 'order') {
      context.read(mainPageController.notifier).setPage(1);
    }
  }
}
