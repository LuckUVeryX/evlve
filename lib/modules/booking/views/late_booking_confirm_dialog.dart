import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/utils/theme_extensions.dart';
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
    return Dialog(
      child: NeuContainer(
        color: context.colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.lateBookingDialogTitle,
                style: context.textTheme.headlineMedium
                    ?.copyWith(color: context.colorScheme.onSurfaceVariant),
              ),
              const SizedBox.square(dimension: 4),
              Text(
                context.l10n.lateBookingDialogContent,
                style: context.textTheme.labelLarge
                    ?.copyWith(color: context.colorScheme.onSurfaceVariant),
              ),
              const SizedBox.square(dimension: 16),
              NeuTextButton(
                onPressed: () => context.pop(true),
                label: context.l10n.dialogContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
