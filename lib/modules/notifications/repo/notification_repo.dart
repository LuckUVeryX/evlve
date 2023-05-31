import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repo.g.dart';

@riverpod
NotificationRepo notificationRepo(NotificationRepoRef ref) {
  final repo = NotificationRepo(ref.watch(awesomeNotificationsProvider));
  ref.onDispose(repo.dispose);
  return repo;
}

class NotificationRepo {
  const NotificationRepo(this._notifications);

  final AwesomeNotifications _notifications;

  Future<bool> init() async {
    return _notifications.initialize(
      null,
      [
        NotificationChannel(
          channelKey: NotificationConst.bookingChannelKey,
          channelName: NotificationConst.bookingChannelName,
          channelDescription: NotificationConst.bookingChannelDescription,
          channelShowBadge: true,
        ),
      ],
      debug: kDebugMode,
    );
  }

  Future<bool> setListeners() {
    return _notifications.setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  Future<bool> requestPermissions() {
    return _notifications.requestPermissionToSendNotifications();
  }

  Future<bool> checkPermissions() {
    return _notifications.isNotificationAllowed();
  }

  Future<void> createBookingNotification({
    required String id,
    required DateTime dt,
    String? title,
    String? body,
  }) {
    return _notifications.createNotification(
      content: NotificationContent(
        id: id.hashCode,
        channelKey: NotificationConst.bookingChannelKey,
        title: title,
        body: body,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar.fromDate(date: dt, preciseAlarm: true),
    );
  }

  Future<void> cancel(int id) {
    return _notifications.cancel(id);
  }

  Future<List<NotificationModel>> listScheduledNotifications() {
    return _notifications.listScheduledNotifications();
  }

  void dispose() {
    _notifications.dispose();
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma('vm:entry-point')
  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification,
  ) async {}

  /// Use this method to detect every time that a new notification is displayed
  @pragma('vm:entry-point')
  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification,
  ) async {}

  /// Use this method to detect if the user dismissed a notification
  @pragma('vm:entry-point')
  static Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {}

  /// Use this method to detect when the user taps on a notification
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {}
}
