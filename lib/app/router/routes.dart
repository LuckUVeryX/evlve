import 'package:evlve/app/app.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/settings/settings.dart';
import 'package:evlve/modules/user/user.dart';
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
    StatefulShellBranch(routes: [$scheduleRoute]),
    StatefulShellBranch(routes: [$settingsRoute]),
  ],
);

@TypedGoRoute<ScheduleRoute>(path: ScheduleRoute.path)
class ScheduleRoute extends GoRouteData {
  const ScheduleRoute();
  static const path = '/';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SchedulePage());
  }
}

@TypedGoRoute<SettingsRoute>(
  path: SettingsRoute.path,
  routes: [
    TypedGoRoute<AccountSettingsRoute>(path: AccountSettingsRoute.path),
    TypedGoRoute<ThemeSettingsRoute>(path: ThemeSettingsRoute.path),
    TypedGoRoute<QRSettingsRoute>(path: QRSettingsRoute.path),
    TypedGoRoute<NotificationsSettingsRoute>(
      path: NotificationsSettingsRoute.path,
    ),
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

class AccountSettingsRoute extends GoRouteData {
  const AccountSettingsRoute();
  static const path = 'account';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountSettingsPage();
  }
}

class NotificationsSettingsRoute extends GoRouteData {
  const NotificationsSettingsRoute();
  static const path = 'notifications';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationSettingsPage();
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
