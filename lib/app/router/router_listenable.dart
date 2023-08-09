import 'package:evlve/app/router/routes.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_listenable.g.dart';

@riverpod
class RouterListenable extends _$RouterListenable implements Listenable {
  VoidCallback? _routerListener;
  AuthState? _authState;

  @override
  Future<void> build() async {
    _authState = await ref.watch(
      authControllerProvider.selectAsync((state) => _authState = state),
    );

    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      _routerListener?.call();
    });
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    return _authState?.map(
      loggedIn: (_) {
        final currentRoute = state.uri.toString();
        final isLoggingIn =
            currentRoute.contains(const LoginRoute().location) ||
                currentRoute.contains(const SplashRoute().location);
        return isLoggingIn ? const ScheduleRoute().location : null;
      },
      loggedOut: (_) => const LoginRoute().location,
      requireOtp: (_) => const OtpRoute().location,
    );
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
