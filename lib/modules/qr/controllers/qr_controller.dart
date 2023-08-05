import 'package:evlve/modules/qr/qr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_controller.g.dart';

@Riverpod(dependencies: [qrPrefRepo])
class QRController extends _$QRController {
  @override
  QRModel build() {
    return ref.watch(qrPrefRepoProvider).qrPref;
  }

  void onQrChanged(QRModel value) {
    state = value;
    return;
  }
}
