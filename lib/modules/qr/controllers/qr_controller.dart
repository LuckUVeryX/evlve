import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_controller.g.dart';

@Riverpod(dependencies: [qrPrefRepo])
class QRController extends _$QRController {
  @override
  void build(BuildContext context) {
    final user = ref.watch(userProvider);
    final qrPref = ref.watch(qrPrefRepoProvider).qrPref;

    void onPhoneShake() {
      if (ModalRoute.of(context)?.isCurrent != true) return;
      QRDialog.show(context, id: user.id);
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
  }
}
