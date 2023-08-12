import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QRFloatingActionButton extends ConsumerWidget {
  const QRFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeuIconButton(
      backgroundColor: context.colorScheme.secondary,
      onPressed: () async {
        await QRDialog.show(ref);
        if (context.mounted) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(context.l10n.qrDialogShakeSnackbar)),
            );
        }
      },
      iconSize: 48,
      icon: Icons.qr_code_rounded,
    );
  }
}
