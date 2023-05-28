import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_controller.g.dart';

@riverpod
class QRController extends _$QRController {
  @override
  void build(BuildContext context) {
    final user = ref.watch(userProvider);

    void onPhoneShake() {
      if (ModalRoute.of(context)?.isCurrent != true) {
        context.pop();
        return;
      }
      QRDialog.show(context, id: user.id);
    }

    ref.watch(shakeRepoProvider(onPhoneShake: onPhoneShake));
  }
}
