import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_notification_provider.g.dart';

@Riverpod(dependencies: [notificationSettingsRepo])
Future<void> scheduleNotification(
  ScheduleNotificationRef ref, {
  required Schedule schedule,
}) async {
  final settings = ref.watch(notificationSettingsRepoProvider);
  if (!settings.upcomingClasses) return;

  await ref.read(notificationRepoProvider).createBookingNotification(
        id: schedule.event.id,
        dt: schedule.start.subtract(settings.notifyBefore),
        title: schedule.title,
        body: schedule.event.classDetails.area.key,
      );
  ref.invalidate(upcomingNotificationsControllerProvider);
}

@riverpod
Future<void> cancelSchedule(
  CancelScheduleRef ref, {
  required int scheduleId,
}) async {
  await ref.read(notificationRepoProvider).cancel(scheduleId);
  ref.invalidate(upcomingNotificationsControllerProvider);
}
