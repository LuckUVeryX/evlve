import 'package:evlve/app/router/routes.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ValueNotifier<AsyncValue<AuthState>>(const AsyncLoading());
  ref
    ..onDispose(authState.dispose)
    ..listen(authControllerProvider, (_, value) {
      authState.value = value;
    });

  final router = GoRouter(
    navigatorKey: rootKey,
    refreshListenable: authState,
    initialLocation: SplashRoute.path,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      if (authState.value.unwrapPrevious().hasError) {
        return const LoginRoute().location;
      }
      if (authState.value.isLoading || !authState.value.hasValue) {
        return const SplashRoute().location;
      }
      final auth = authState.value.requireValue;
      return auth.map(
        loggedIn: (_) {
          final currentRoute = state.uri.toString();
          final isLoggingIn =
              currentRoute.startsWith(const LoginRoute().location) ||
                  currentRoute == const SplashRoute().location;
          return isLoggingIn ? const ScheduleRoute().location : null;
        },
        loggedOut: (_) => const LoginRoute().location,
        requireOtp: (_) => const OtpRoute().location,
      );
    },
  );

  ref.onDispose(router.dispose);

  return router;
}
