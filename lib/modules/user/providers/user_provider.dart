import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
User user(UserRef ref) {
  return ref
      .watch(authControllerProvider)
      .requireValue
      .whenOrNull(loggedIn: (user) => user)!;
}
