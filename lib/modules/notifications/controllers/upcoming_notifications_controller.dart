import 'package:evlve/modules/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upcoming_notifications_controller.g.dart';

@riverpod
class UpcomingNotificationsController
    extends _$UpcomingNotificationsController {
  @override
  FutureOr<List<UpcomingNotification>> build() async {
    final notifications =
        await ref.watch(notificationRepoProvider).listScheduledNotifications();

    final retVal = <UpcomingNotification>[];
    for (final notification in notifications) {
      final upcoming = UpcomingNotification.fromModel(notification);
      if (upcoming != null) retVal.add(upcoming);
    }
    return retVal;
  }

  Future<void> cancelUpcoming(int id) async {
    state = AsyncData(
      [...state.requireValue]..removeWhere((element) => element.id == id),
    );
    ref.read(cancelScheduleProvider(scheduleId: id));
  }
}
