import 'package:evlve/app/app.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_controller.g.dart';

@Riverpod(dependencies: [qrPrefRepo])
class QRController extends _$QRController {
  @override
  QRModel build(BuildContext context) {
    final qrPref = ref.watch(qrPrefRepoProvider).qrPref;

    void onPhoneShake() {
      if (ModalRoute.of(context)?.isCurrent != true) return;
      // Disable shake feature when adjusting QR code settings
      final router = ref.read(routerProvider);
      if (router.location.contains('${const SettingsRoute().location}/')) {
        return;
      }

      QRDialog.show(context);
    }

    ref.watch(
      shakeRepoProvider(
        onPhoneShake: onPhoneShake,
        debounce: qrPref.debounce,
        minShakeCount: qrPref.shakeCount,
        shakeCountReset: qrPref.shakeCountReset,
        shakeThresholdForce: qrPref.shakeThresholdForce,
      ),
    );
    return qrPref;
  }
}
