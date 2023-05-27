import 'package:evlve/modules/auth/repo/repo.dart';
import 'package:evlve/modules/auth/states/states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  (String? email, String? password) _cred = (null, null);

  @override
  FutureOr<AuthState> build() async {
    final repo = ref.watch(authRepoProvider);
    ref.listenSelf((_, value) {
      value.whenOrNull(error: (e, st) => repo.signOut());
    });
    return _attemptTokenSignIn();
  }

  Future<AuthState> _attemptTokenSignIn() async {
    final repo = ref.read(authRepoProvider);
    try {
      await repo.signInWithToken();
      return const AuthState.loggedIn();
    } catch (e) {
      return const AuthState.loggedOut();
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncData(AuthState.loggedOut());
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepoProvider);
      final res = await repo.signIn(email: email, password: password);
      if (res.token != null) return const AuthState.loggedIn();
      _cred = (email, password);
      return const AuthState.requireOtp();
    });
  }

  Future<void> signInOtp(String otp) async {
    final (email, password) = _cred;
    assert(
      email != null && password != null,
      'Credentials should have been saved from signIn',
    );

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepoProvider);
      final res = await repo.signIn(
        email: email!,
        password: password!,
        otp: otp,
      );
      if (res.token == null) state = const AsyncData(AuthState.requireOtp());
      _cred = (null, null);
      return const AuthState.loggedIn();
    });
  }

  Future<void> resendOtp() async {
    final (email, password) = _cred;
    assert(
      email != null && password != null,
      'Credentials should have been saved from signIn',
    );

    state = const AsyncData(AuthState.loggedOut());
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepoProvider);
      await repo.signIn(email: email!, password: password!);
      return const AuthState.requireOtp();
    });
  }

  Future<void> logout() async {
    final repo = ref.read(authRepoProvider);
    state = const AsyncLoading();
    await repo.signOut();
    state = const AsyncData(AuthState.loggedOut());
  }
}
