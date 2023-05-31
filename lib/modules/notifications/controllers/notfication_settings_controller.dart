import 'package:evlve/modules/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notfication_settings_controller.g.dart';

@Riverpod(dependencies: [notificationSettingsRepo])
class NotificationSettingsController extends _$NotificationSettingsController {
  @override
  FutureOr<NotificationSettingsState> build() {
    final settings = ref.read(notificationSettingsRepoProvider);
    return settings.upcomingClasses
        ? NotificationSettingsState.enabled(notifyBefore: settings.notifyBefore)
        : const NotificationSettingsState.disabled();
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> onSettingChanged(bool value) async {
    final settings = ref.read(notificationSettingsRepoProvider);
    final notification = ref.read(notificationRepoProvider);
    state = AsyncData(
      value
          ? NotificationSettingsState.enabled(
              notifyBefore: settings.notifyBefore,
            )
          : const NotificationSettingsState.disabled(),
    );
    state = const AsyncLoading();

    if (value) {
      // Check Permissions
      state = await AsyncValue.guard(() async {
        final p = await notification.checkPermissions();
        return p
            ? NotificationSettingsState.enabled(
                notifyBefore: settings.notifyBefore,
              )
            : const NotificationSettingsState.noPermissions();
      });
    } else {
      state = const AsyncData(NotificationSettingsState.disabled());
    }

    await settings.saveUpcomingClasses(value: state.requireValue.value);
  }

  Future<void> requestPermissions() async {
    final settings = ref.read(notificationSettingsRepoProvider);
    final notification = ref.read(notificationRepoProvider);

    state = await AsyncValue.guard(() async {
      final p = await notification.requestPermissions();
      return p
          ? NotificationSettingsState.enabled(
              notifyBefore: settings.notifyBefore,
            )
          : const NotificationSettingsState.disabled();
    });

    await settings.saveUpcomingClasses(value: state.requireValue.value);
  }

  Future<void> onNotifyBeforeChanged(Duration duration) async {
    final durationRounded = _roundTo5Min(duration);
    final settings = ref.read(notificationSettingsRepoProvider);

    state = AsyncData(
      NotificationSettingsState.enabled(notifyBefore: durationRounded),
    );
    await settings.saveNotifyBefore(durationRounded);
  }
}

Duration _roundTo5Min(Duration duration) {
  final roundedDuration = Duration(
    minutes: (duration.inMinutes / 5).round() * 5,
  );
  return roundedDuration;
}
