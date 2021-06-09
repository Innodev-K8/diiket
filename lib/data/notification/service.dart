import 'dart:async';

import 'package:diiket/data/notification/channels.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
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
}
