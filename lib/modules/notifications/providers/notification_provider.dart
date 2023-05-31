import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_provider.g.dart';

@riverpod
AwesomeNotifications awesomeNotifications(AwesomeNotificationsRef ref) {
  return AwesomeNotifications();
}
