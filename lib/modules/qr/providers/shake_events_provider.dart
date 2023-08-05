import 'dart:math';

import 'package:evlve/modules/qr/qr.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'shake_events_provider.freezed.dart';
part 'shake_events_provider.g.dart';

@riverpod
Stream<ShakeEvent> shakeEvent(ShakeEventRef ref) async* {
  const gravity = 9.807;

  var latestShake = DateTime.now();
  var shakeCount = 0;
  final qr = ref.watch(qRControllerProvider);

  await for (final event in accelerometerEvents) {
    final forceSquared =
        (pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2)) / pow(gravity, 2);
    if (forceSquared > pow(qr.shakeThresholdForce, 2)) {
      final now = DateTime.now();

      if (latestShake.add(qr.debounce).isAfter(now)) {
        continue;
      }

      if (latestShake.add(qr.shakeCountReset).isBefore(now)) {
        shakeCount = 0;
      }

      latestShake = now;
      shakeCount++;

      if (shakeCount >= qr.shakeCount) {
        yield const ShakeEvent();
      }
    }
  }
}

@freezed
class ShakeEvent with _$ShakeEvent {
  const factory ShakeEvent() = _ShakeEvent;
}
