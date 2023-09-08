import 'package:flutter/material.dart';
import 'package:push_notification/pages/home_page.dart';
import 'package:push_notification/pages/notification_page.dart';
import 'package:push_notification/routes/routes_text.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    RoutesText.home: (context) => HomePage(),
    RoutesText.notificationPage: (context) => NotificationPage(),
  };

  static String initial = RoutesText.home;

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
