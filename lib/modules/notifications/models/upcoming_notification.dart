import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_notification.freezed.dart';

@freezed
class UpcomingNotification with _$UpcomingNotification {
  const factory UpcomingNotification({
    required int id,
    required String title,
    required String body,
    required DateTime dt,
  }) = _UpcomingNotification;

  const UpcomingNotification._();

  static UpcomingNotification? fromModel(NotificationModel model) {
    final id = model.content?.id;
    final title = model.content?.title;
    final body = model.content?.body;
    final schedule = model.schedule;
    if (id == null ||
        title == null ||
        body == null ||
        schedule == null ||
        schedule is! NotificationCalendar) return null;

    if (schedule.year == null ||
        schedule.month == null ||
        schedule.day == null ||
        schedule.hour == null ||
        schedule.minute == null ||
        schedule.second == null) return null;

    return UpcomingNotification(
      id: id,
      title: title,
      body: body,
      dt: DateTime(
        schedule.year!,
        schedule.month!,
        schedule.day!,
        schedule.hour!,
        schedule.minute!,
        schedule.second!,
      ),
    );
  }
}
