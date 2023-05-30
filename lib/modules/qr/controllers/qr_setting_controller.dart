import 'package:evlve/modules/qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_setting_controller.g.dart';

@Riverpod(dependencies: [qrPrefRepo])
class QRSettingController extends _$QRSettingController {
  @override
  QRModel build() {
    return ref.watch(qrPrefRepoProvider).qrPref;
  }

  void reset() {
    state = const QRModel();
  }

  void onEyeShapeChanged(QrEyeShape? shape) {
    if (shape == null) return;
    state = state.copyWith(eyeShape: shape);
  }

  void onDataShapeChanged(QrDataModuleShape? shape) {
    if (shape == null) return;
    state = state.copyWith(dataModuleShape: shape);
  }

  void onShakeCountChanged(double value) {
    state = state.copyWith(shakeCount: value.toInt());
  }

  void onShakeThresholdForceChange(double value) {
    state = state.copyWith(shakeThresholdForce: value);
  }

  void onDebounceChanged(double value) {
    state = state.copyWith(debounce: Duration(milliseconds: value.toInt()));
  }

  void onShakeCountResetChanged(double value) {
    state = state.copyWith(
      shakeCountReset: Duration(milliseconds: value.toInt()),
    );
  }

  Future<void> applySettings() async {
    await ref.read(qrPrefRepoProvider).saveQRPref(state);
  }
}
