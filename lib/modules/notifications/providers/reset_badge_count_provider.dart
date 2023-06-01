import 'package:evlve/modules/notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_badge_count_provider.g.dart';

@riverpod
Future<void> resetBadgeCount(ResetBadgeCountRef ref) {
  return ref.watch(notificationRepoProvider).resetBadgeCount();
}
