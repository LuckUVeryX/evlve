import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_settings_state.freezed.dart';

@freezed
class NotificationSettingsState with _$NotificationSettingsState {
  const factory NotificationSettingsState.disabled() = _Disabled;
  const factory NotificationSettingsState.enabled() = _Enabled;
  const factory NotificationSettingsState.noPermissions() = _NoPermissions;

  const NotificationSettingsState._();

  bool get value => maybeWhen(orElse: () => false, enabled: () => true);
}
