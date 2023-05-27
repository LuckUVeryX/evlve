import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loggedIn() = _LoggedIn;
  const factory AuthState.loggedOut() = _LoggedOut;
  const factory AuthState.requireOtp() = _RequireOtp;
}
