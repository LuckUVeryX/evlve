import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settingsNotifications),
      ),
      body: ListView(
        children: const [
          _UpcomingClassesSwitchListTile(),
        ],
      ),
    );
  }
}

class _UpcomingClassesSwitchListTile extends ConsumerWidget {
  const _UpcomingClassesSwitchListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(notificationSettingsControllerProvider);

    ref
      ..listenErrors([notificationSettingsControllerProvider])
      ..listen(
        notificationSettingsControllerProvider,
        (_, value) {
          value.whenOrNull(
            data: (state) => state.whenOrNull(
              noPermissions: () => ref
                  .read(notificationSettingsControllerProvider.notifier)
                  .requestPermissions(),
            ),
          );
        },
      );

    return SwitchListTile(
      value: asyncValue.requireValue.value,
      onChanged: asyncValue.isLoading
          ? null
          : ref.read(notificationSettingsControllerProvider.notifier).onChanged,
      title: Text(context.l10n.settingsNotificationUpcomingClasses),
    );
  }
}
