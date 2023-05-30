import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'shake_repo.g.dart';

@riverpod
ShakeRepo shakeRepo(
  ShakeRepoRef ref, {
  required double shakeThresholdForce,
  required Duration debounce,
  required Duration shakeCountReset,
  required int minShakeCount,
  VoidCallback? onPhoneShake,
}) {
  final repo = ShakeRepo(
    onPhoneShake: onPhoneShake,
    debounce: debounce,
    minShakeCount: minShakeCount,
    shakeCountReset: shakeCountReset,
    shakeThresholdForce: shakeThresholdForce,
  );
  ref.onDispose(repo._dispose);
  return repo;
}

class ShakeRepo {
  ShakeRepo({
    required this.onPhoneShake,
    required this.debounce,
    required this.minShakeCount,
    required this.shakeCountReset,
    required this.shakeThresholdForce,
  }) {
    _init();
  }

  final VoidCallback? onPhoneShake;
  final Duration debounce;
  final int minShakeCount;
  final Duration shakeCountReset;
  final double shakeThresholdForce;

  static const _gravity = 9.807;

  DateTime _latestShake = DateTime.now();
  int _shakeCount = 0;

  StreamSubscription<AccelerometerEvent>? _streamSubscription;

  void _init() {
    _streamSubscription = accelerometerEvents.listen((event) {
      final forceSquared =
          (pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2)) /
              pow(_gravity, 2);
      if (forceSquared > pow(shakeThresholdForce, 2)) {
        final now = DateTime.now();

        if (_latestShake.add(debounce).isAfter(now)) {
          return;
        }

        if (_latestShake.add(shakeCountReset).isBefore(now)) {
          _shakeCount = 0;
        }

        _latestShake = now;
        _shakeCount++;

        if (_shakeCount >= minShakeCount) {
          onPhoneShake?.call();
        }
      }
    });
  }

  void _dispose() {
    _streamSubscription?.cancel();
  }
}
