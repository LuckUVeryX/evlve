import 'dart:async';

import 'package:evlve/modules/qr/qr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_brightness_provider.g.dart';

/// Raises screenbrightness for the duration of callback.
@riverpod
Future<void> raiseBrightness(
  RaiseBrightnessRef ref,
  Future<void> Function() callback,
) async {
  final repo = ref.read(screenBrightnessRepoProvider);
  unawaited(repo.setMaxBrightness());
  await callback.call();
  unawaited(repo.resetBrightness());
}
