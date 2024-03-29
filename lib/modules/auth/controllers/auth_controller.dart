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
    ref.listenSelf(
      (_, value) {
        value.whenOrNull(error: (e, st) => repo.signOut());
      },
      onError: (e, st) => repo.signOut(),
    );
    return _attemptTokenSignIn();
  }

  Future<AuthState> _attemptTokenSignIn() async {
    final repo = ref.read(authRepoProvider);
    try {
      final user = await repo.signInWithToken();
      return AuthState.loggedIn(user);
    } catch (e) {
      return const AuthState.loggedOut();
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncData(AuthState.loggedOut());
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepoProvider);
      final res = await repo.login(email: email, password: password);
      if (res.token != null) return AuthState.loggedIn(res.user);
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
      final res = await repo.login(
        email: email!,
        password: password!,
        otp: otp,
      );
      if (res.token == null) return const AuthState.requireOtp();
      _cred = (null, null);
      return AuthState.loggedIn(res.user);
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
      await repo.login(email: email!, password: password!);
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
