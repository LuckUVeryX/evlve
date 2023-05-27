import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_date_controller.g.dart';

@riverpod
class ScheduleDateController extends _$ScheduleDateController {
  @override
  DateTime build() {
    return DateTime.now();
  }

  // ignore: use_setters_to_change_properties
  void onDateSelected(DateTime dt) {
    state = dt;
  }

  void resetDate() {
    state = DateTime.now();
  }
}
