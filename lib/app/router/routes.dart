import 'package:evlve/app/app.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/settings/settings.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const path = '/splash';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<SignInRoute>(
  path: SignInRoute.path,
  routes: [TypedGoRoute<OTPRoute>(path: OTPRoute.path)],
)
class SignInRoute extends GoRouteData {
  const SignInRoute();
  static const path = '/auth';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SigninPage();
  }
}

class OTPRoute extends GoRouteData {
  const OTPRoute();
  static const path = 'OTP';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OTPPage();
  }
}

final rootRoute = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) {
    return RootPage(navigationShell: navigationShell);
  },
  branches: [
    StatefulShellBranch(routes: [$homeRoute]),
    StatefulShellBranch(routes: [$settingsRoute]),
  ],
);

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SchedulePage());
  }
}

@TypedGoRoute<SettingsRoute>(
  path: SettingsRoute.path,
  routes: [
    TypedGoRoute<ThemeSettingsRoute>(path: ThemeSettingsRoute.path),
    TypedGoRoute<QRSettingsRoute>(path: QRSettingsRoute.path),
  ],
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();
  static const path = '/settings';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SettingsPage());
  }
}

class ThemeSettingsRoute extends GoRouteData {
  const ThemeSettingsRoute();
  static const path = 'theme';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThemeSettingsPage();
  }
}

class QRSettingsRoute extends GoRouteData {
  const QRSettingsRoute();
  static const path = 'qr';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const QRSettingsPage();
  }
}
