import 'package:evlve/modules/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upcoming_notifications_provider.g.dart';

@riverpod
Future<List<UpcomingNotification>> upcomingNotifications(
  UpcomingNotificationsRef ref,
) async {
  final notifications =
      await ref.watch(notificationRepoProvider).listScheduledNotifications();

  final retVal = <UpcomingNotification>[];
  for (final notification in notifications) {
    final upcoming = UpcomingNotification.fromModel(notification);
    if (upcoming != null) retVal.add(upcoming);
  }
  return retVal;
}
