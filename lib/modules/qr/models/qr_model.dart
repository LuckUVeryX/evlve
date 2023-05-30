import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_model.freezed.dart';
part 'qr_model.g.dart';

@freezed
class QRModel with _$QRModel {
  const factory QRModel({
    @Default(2.5) double shakeThresholdForce,
    @Default(Duration(milliseconds: 250)) Duration debounce,
    @Default(Duration(seconds: 3)) Duration shakeCountReset,
    @Default(1) int shakeCount,
  }) = _QRModel;

  factory QRModel.fromJson(Map<String, dynamic> json) =>
      _$QRModelFromJson(json);

  const QRModel._();

  static const int minShakeCount = 1;
  static const int maxShakeCount = 5;

  static const double minShakeThresholdForce = 2;
  static const double maxShakeThresholdForce = 5;

  static const Duration minDebounce = Duration(milliseconds: 100);
  static const Duration maxDebounce = Duration(seconds: 1);

  static const Duration minShakeCountReset = Duration(seconds: 1);
  static const Duration maxShakeCountReset = Duration(seconds: 10);
}
