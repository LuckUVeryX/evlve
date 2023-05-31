import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_settings_state.freezed.dart';

@freezed
class NotificationSettingsState with _$NotificationSettingsState {
  const factory NotificationSettingsState.enabled({
    required Duration notifyBefore,
  }) = _Enabled;
  const factory NotificationSettingsState.disabled() = _Disabled;
  const factory NotificationSettingsState.noPermissions() = _NoPermissions;

  const NotificationSettingsState._();

  bool get value => maybeMap(orElse: () => false, enabled: (_) => true);
}
