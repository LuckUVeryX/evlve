import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_controller.g.dart';

@riverpod
class QRController extends _$QRController {
  @override
  void build(BuildContext context) {
    final user = ref.watch(userProvider);
    ref.watch(
      shakeRepoProvider(
        onPhoneShake: () {
          if (ModalRoute.of(context)?.isCurrent ?? false) return;
          QRDialog.show(context, id: user.id);
        },
      ),
    );
  }
}
