import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'schedule_date_controller.g.dart';

@riverpod
class ScheduleDateController extends _$ScheduleDateController {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void onViewChanged(ViewChangedDetails details) {
    Future(() => state = details.visibleDates.first);
  }
}
