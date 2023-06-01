import 'package:duration_picker/duration_picker.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/theme/utils/utils.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settingsNotifications),
      ),
      body: const Column(
        children: [
          _UpcomingClassesSwitchListTile(),
          SizedBox(height: 16),
          _DurationPicker(),
          SizedBox(height: 24),
          Expanded(
            child: _UpcomingNotificationsListView(),
          ),
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
          : ref
              .read(notificationSettingsControllerProvider.notifier)
              .onSettingChanged,
      title: Text(context.l10n.settingsNotificationNotifyMeBeforeClass),
    );
  }
}

class _DurationPicker extends ConsumerWidget {
  const _DurationPicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(notificationSettingsControllerProvider);

    return asyncValue.maybeWhen(
      orElse: () => const Offstage(),
      data: (state) {
        return state.maybeWhen(
          orElse: () => const Offstage(),
          enabled: (notifyBefore) {
            return DurationPicker(
              width: double.infinity,
              onChange: ref
                  .read(notificationSettingsControllerProvider.notifier)
                  .onNotifyBeforeChanged,
              duration: notifyBefore,
            );
          },
        );
      },
    );
  }
}

class _UpcomingNotificationsListView extends ConsumerWidget {
  const _UpcomingNotificationsListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlidableAutoCloseBehavior(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final asyncValue = ref.watch(notificationSettingsControllerProvider);
          return asyncValue.when(
            data: (state) {
              return state.maybeWhen(
                orElse: () => null,
                enabled: (_) {
                  final upcoming =
                      ref.watch(upcomingNotificationsControllerProvider);
                  return upcoming.maybeWhen(
                    orElse: () => null,
                    data: (notifications) {
                      if (index > notifications.length) return null;

                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16)
                              .copyWith(bottom: 8),
                          child: Text(
                            context
                                .l10n.settingsNotificationUpcomingNotifications,
                          ),
                        );
                      }

                      final notification = notifications[index - 1];

                      return _UpcomingNotificationListTile(
                        notification: notification,
                      );
                    },
                  );
                },
              );
            },
            error: (error, stackTrace) => Padding(
              padding: const EdgeInsets.all(16),
              child: Text(error.toString()),
            ),
            loading: () => null,
          );
        },
      ),
    );
  }
}

class _UpcomingNotificationListTile extends ConsumerWidget {
  const _UpcomingNotificationListTile({
    required this.notification,
  });

  final UpcomingNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slideableAction = SlidableAction(
      onPressed: null,
      backgroundColor: context.colorScheme.error,
      foregroundColor: context.colorScheme.onError,
      icon: Icons.delete,
      label:
          context.l10n.settingsNotificationUpcomingNotificationsSlideableDelete,
    );

    // TODO(Ryan): Edit Notification

    return Slidable(
      groupTag: '_UpcomingNotificationListTile',
      key: ValueKey(notification.id),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [slideableAction],
      ),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(
          closeOnCancel: true,
          confirmDismiss: () async {
            final confirm = await NotificationConfirmDeleteDialog.show(
              context,
            );
            return confirm ?? false;
          },
          onDismissed: () => ref
              .read(upcomingNotificationsControllerProvider.notifier)
              .cancelUpcoming(notification.id),
        ),
        motion: const DrawerMotion(),
        children: [slideableAction],
      ),
      child: ListTile(
        title: Text(notification.title),
        subtitle: Text(notification.body),
        trailing: Text(
          DateFormat('EEEE HH:mm:ss').format(
            notification.dt.toLocal(),
          ),
        ),
      ),
    );
  }
}
