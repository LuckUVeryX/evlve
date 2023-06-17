import 'package:evlve/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:screen_brightness/screen_brightness.dart';

part 'screen_brightness_repo.g.dart';

@riverpod
ScreenBrightnessRepo screenBrightnessRepo(ScreenBrightnessRepoRef ref) {
  return ScreenBrightnessRepo(ref.watch(screenBrightnessProvider));
}

class ScreenBrightnessRepo {
  const ScreenBrightnessRepo(this._brightness);

  final ScreenBrightness _brightness;

  Future<void> setMaxBrightness() {
    return _brightness.setScreenBrightness(1);
  }

  Future<void> resetBrightness() {
    return _brightness.resetScreenBrightness();
  }
}
