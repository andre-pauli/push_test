import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/routes/routes.dart';
import 'package:push_notification/routes/routes_text.dart';

Future<void> handleBackgoundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    Navigator.of(Routes.navigatorKey!.currentState!.context)
        .pushNamed(RoutesText.notificationPage);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgoundMessage);
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    await getToken();
    initPushNotifications();
  }

  getToken() async {
    final fcmToken = await _firebaseMessaging.getToken();
    //use token
    print(fcmToken);
  }
}
