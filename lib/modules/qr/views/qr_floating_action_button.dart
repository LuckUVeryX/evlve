import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QRFloatingActionButton extends ConsumerWidget {
  const QRFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        ref.read(setMaxBrightnessProvider);
        await QRDialog.show(context);
        ref.read(resetBrightnessProvider);
        if (context.mounted) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(context.l10n.qrDialogShakeSnackbar)),
            );
        }
      },
      child: const Icon(Icons.qr_code_rounded),
    );
  }
}
