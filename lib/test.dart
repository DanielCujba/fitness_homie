import "package:test/test.dart";
import 'notifications.dart' as Notification;

Future<void> water() async {
  Notification.addNotification("Water Reminder",
      "You haven't drink water in a long time. You should drink some");
}

Future<void> instagram() async {
  Notification.addNotification("Instagram Warning",
      "Hey! You have been spending quite some time on Instagram. Maybe you should take a break");
}

Future<void> sleep() async {
  Notification.addNotification(
      "Sleep Reminder", "Hey! It's quite late. Maybe you should go to sleep");
}
