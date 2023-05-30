import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDialog extends ConsumerWidget {
  const QRDialog._();

  static Future<void> show(BuildContext context) {
    return showDialog(context: context, builder: (_) => const QRDialog._());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Dialog(
      child: QRCode(),
    );
  }
}

class QRCode extends ConsumerWidget {
  const QRCode({
    super.key,
    this.imageDimension = 40,
  });

  final double imageDimension;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(userProvider).id;
    final qr = ref.watch(qRSettingControllerProvider);
    return QrImageView(
      data: id,
      eyeStyle: QrEyeStyle(
        eyeShape: qr.eyeShape,
        color: context.colorScheme.onSurface,
      ),
      dataModuleStyle: QrDataModuleStyle(
        dataModuleShape: qr.dataModuleShape,
        color: context.colorScheme.onSurface,
      ),
    );
  }
}
