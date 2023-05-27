import 'package:evlve/utils/date_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule_date_controller.g.dart';

@riverpod
class ScheduleDateController extends _$ScheduleDateController {
  @override
  DateTime build() {
    return DateTime.now().stripTime();
  }

  void onDateSelected(DateTime dt) {
    state = dt.stripTime();
  }

  void resetDate() {
    state = DateTime.now().stripTime();
  }
}
