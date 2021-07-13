import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message ${message.messageId}');

  // await Firebase.initializeApp();
  // await NotificationService().initialize();

  // if (message.notification != null) {
  //   RemoteNotification notification = message.notification!;

  //   NotificationService().instance.show(
  //         notification.hashCode,
  //         notification.title,
  //         notification.body,
  //         NotificationDetails(
  //           android: NotificationChannels.feed,
  //         ),
  //       );
  // }
}
