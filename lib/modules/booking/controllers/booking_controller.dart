import 'package:evlve/modules/booking/booking.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/modules/schedule/models/models.dart';
import 'package:evlve/modules/tester/tester.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_controller.g.dart';

@riverpod
class BookingController extends _$BookingController {
  @override
  FutureOr<BookingResponse> build({required Schedule schedule}) async {
    return BookingResponse(schedule: schedule, message: null);
  }

  Future<void> book() async {
    await _optimisticUpdate(true);
    await ref.read(scheduleNotificationProvider(schedule: schedule).future);
  }

  Future<void> cancel() async {
    await _optimisticUpdate(false);
    await ref.read(
      cancelScheduleProvider(scheduleId: schedule.event.id.hashCode).future,
    );
  }

  Future<void> _optimisticUpdate(bool toBook) async {
    final repo = ref.read(bookingRepoProvider);
    final value = state.value;
    if (value != null) {
      state = AsyncData(
        value.copyWith.schedule.event.classDetails(isBookedByMe: toBook),
      );
    }

    // ! Avoid testflight testers from actually booking classes
    final isTester = ref.read(testerProvider);
    if (isTester) return;
    // !

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return toBook
          ? repo.book(id: schedule.event.id, dt: schedule.start)
          : repo.cancel(id: schedule.event.id, dt: schedule.start);
    });

    if (state.hasError && value != null) {
      state = AsyncData(value).copyWithPrevious(state);
      return;
    }
  }
}
