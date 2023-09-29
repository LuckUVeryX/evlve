import 'dart:async';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tester_detector_controller.g.dart';

@riverpod
class TesterDetectorController extends _$TesterDetectorController {
  static const tapCount = 10;
  static const _duration = Duration(milliseconds: 500);

  Timer? _timer;
  @override
  int build() {
    ref.onDispose(() => _timer?.cancel());
    return 0;
  }

  void incrementCount() {
    state = min(tapCount, state + 1);
    _timer?.cancel();
    _timer = Timer(_duration, () => state = 0);
  }
}
