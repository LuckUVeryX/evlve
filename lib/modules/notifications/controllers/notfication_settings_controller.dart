import 'package:evlve/modules/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notfication_settings_controller.g.dart';

@Riverpod(dependencies: [notificationSettingsRepo, notificationSettingsRepo])
class NotificationSettingsController extends _$NotificationSettingsController {
  @override
  FutureOr<NotificationSettingsState> build() {
    return ref.watch(notificationSettingsRepoProvider).upcomingClasses
        ? const NotificationSettingsState.enabled()
        : const NotificationSettingsState.disabled();
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> onChanged(bool value) async {
    // Optimistic Update
    state = AsyncData(
      value
          ? const NotificationSettingsState.enabled()
          : const NotificationSettingsState.disabled(),
    );
    state = const AsyncLoading();

    final settings = ref.read(notificationSettingsRepoProvider);
    final notification = ref.read(notificationRepoProvider);

    if (value) {
      // Check Permissions
      state = await AsyncValue.guard(() async {
        final p = await notification.checkPermissions();
        return p
            ? const NotificationSettingsState.enabled()
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
          ? const NotificationSettingsState.enabled()
          : const NotificationSettingsState.disabled();
    });

    await settings.saveUpcomingClasses(value: state.requireValue.value);
  }
}
