import 'package:evlve/modules/qr/qr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_brightness_provider.g.dart';

@riverpod
Future<void> setMaxBrightness(SetMaxBrightnessRef ref) {
  return ref.watch(screenBrightnessRepoProvider).setMaxBrightness();
}

@riverpod
Future<void> resetBrightness(ResetBrightnessRef ref) {
  return ref.watch(screenBrightnessRepoProvider).resetBrightness();
}
