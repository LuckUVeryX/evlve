import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LateBookingConfirmDialog extends StatelessWidget {
  const LateBookingConfirmDialog._();

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const LateBookingConfirmDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconColor: context.colorScheme.error,
      title: Text(
        context.l10n.lateBookingDialogTitle,
        style: context.textTheme.headlineSmall?.copyWith(
          color: context.colorScheme.onSurface,
        ),
      ),
      content: Text(
        context.l10n.lateBookingDialogContent,
        style: context.textTheme.bodyMedium
            ?.copyWith(color: context.colorScheme.onSurface),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(true),
          child: Text(context.l10n.dialogContinue),
        ),
      ],
    );
  }
}
