import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_date_controller.g.dart';

@riverpod
class ResetDateController extends _$ResetDateController {
  @override
  Object build() => Object();
  void resetDate() => state = Object();
}
