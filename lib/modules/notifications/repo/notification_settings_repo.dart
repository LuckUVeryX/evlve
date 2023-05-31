import 'package:evlve/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notification_settings_repo.g.dart';

@Riverpod(dependencies: [sharedPreferences])
NotificationSettingsRepo notificationSettingsRepo(
  NotificationSettingsRepoRef ref,
) {
  return NotificationSettingsRepo(ref.watch(sharedPreferencesProvider));
}

class NotificationSettingsRepo {
  const NotificationSettingsRepo(this._pref);

  final SharedPreferences _pref;

  static const _upcomingClassesKey = 'kUpcomingClasses';
  bool get upcomingClasses => _pref.getBool(_upcomingClassesKey) ?? false;
  Future<void> saveUpcomingClasses({required bool value}) async {
    await _pref.setBool(_upcomingClassesKey, value);
  }

  static const _notifyBeforeDurationKey = 'kNotifyBeforeDuration';
  Duration get notifyBefore => Duration(
        seconds: _pref.getInt(_notifyBeforeDurationKey) ??
            Duration.secondsPerMinute * 30,
      );
  Future<void> saveNotifyBefore(Duration duration) async {
    await _pref.setInt(_notifyBeforeDurationKey, duration.inSeconds);
  }
}
