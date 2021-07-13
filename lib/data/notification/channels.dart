import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationChannels {
  NotificationChannels._();

  static const AndroidNotificationChannel defaultChannel =
      AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  static const AndroidNotificationDetails feed =
      AndroidNotificationDetails(
    'diiket',
    'Diiket',
    'Display Feeds',
    importance: Importance.high,
    priority: Priority.high,
    styleInformation: BigTextStyleInformation(''),
  );

  static const AndroidNotificationDetails order =
      AndroidNotificationDetails(
    'order',
    'Pesanan',
    'Notifikasi status pesanan',
    importance: Importance.max,
    priority: Priority.max,
    enableLights: true,
    styleInformation: BigTextStyleInformation(''),
  );
}
