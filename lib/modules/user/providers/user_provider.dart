import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
User user(UserRef ref) {
  // `read` instead of `watch` as we
  // dont want to get null check errors when user logs out
  return ref
      .read(authControllerProvider)
      .requireValue
      .whenOrNull(loggedIn: (user) => user)!;
}
