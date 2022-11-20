import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
final r = Random(4);

Future<void> setup() async {
  const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidSetting);
  await _localNotificationsPlugin.initialize(initSettings).then((value) => {});
}

Future<void> addNotification(title, body) async {
  const androidDetail =
      AndroidNotificationDetails("0", "Notifications", groupKey: "Key");

  final id = r.nextInt(100000);
  final noticeDetail = const NotificationDetails(android: androidDetail);

  await _localNotificationsPlugin.show(
    id,
    title,
    body,
    noticeDetail,
  );
}
