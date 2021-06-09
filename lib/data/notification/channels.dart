import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationChannels {
  NotificationChannels._();

  static const AndroidNotificationChannel defaultChannel =
      const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  static const AndroidNotificationDetails feed =
      const AndroidNotificationDetails(
    'diiket',
    'Diiket',
    'Display Feeds',
    importance: Importance.high,
    priority: Priority.high,
    styleInformation: BigTextStyleInformation(''),
  );

  static const AndroidNotificationDetails order =
      const AndroidNotificationDetails(
    'order',
    'Pesanan',
    'Notifikasi status pesanan',
    importance: Importance.max,
    priority: Priority.max,
    enableVibration: true,
    playSound: true,
    enableLights: true,
    styleInformation: BigTextStyleInformation(''),
  );
}
