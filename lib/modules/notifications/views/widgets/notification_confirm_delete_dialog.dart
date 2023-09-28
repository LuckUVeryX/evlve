import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationConfirmDeleteDialog extends StatelessWidget {
  const NotificationConfirmDeleteDialog._();

  static Future<bool?> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const NotificationConfirmDeleteDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(
        context.l10n.settingsNotificationConfirmDeleteDialogTitle,
        style: context.textTheme.titleLarge
            ?.copyWith(color: context.colorScheme.onSurfaceVariant),
      ),
      content:
          Text(context.l10n.settingsNotificationConfirmDeleteDialogContent),
      actions: [
        TextButton(
          onPressed: context.pop,
          child: Text(
            context.l10n.settingsNotificationConfirmDeleteDialogCancel,
          ),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: Text(
            context.l10n.settingsNotificationConfirmDeleteDialogDelete,
          ),
        ),
      ],
    );
  }
}
