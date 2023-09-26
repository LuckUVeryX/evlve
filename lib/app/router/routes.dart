import 'package:evlve/app/app.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/root/widgets/pages/root_page.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/settings/settings.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const path = '/splash';
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SplashPage());
  }
}

@TypedGoRoute<LoginRoute>(
  path: LoginRoute.path,
  routes: [TypedGoRoute<OtpRoute>(path: OtpRoute.path)],
)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const path = '/auth';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

class OtpRoute extends GoRouteData {
  const OtpRoute();
  static const path = 'otp';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OtpPage();
  }
}

@TypedStatefulShellRoute<RootRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ScheduleRoute>(
          path: ScheduleRoute.path,
          routes: [
            TypedGoRoute<SettingsRoute>(
              path: SettingsRoute.path,
              routes: [
                TypedGoRoute<AccountSettingsRoute>(
                  path: AccountSettingsRoute.path,
                ),
                TypedGoRoute<NotificationSettingsRoute>(
                  path: NotificationSettingsRoute.path,
                ),
                TypedGoRoute<QrSettingsRoute>(
                  path: QrSettingsRoute.path,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<AttendanceRoute>(path: AttendanceRoute.path),
      ],
    ),
  ],
)
class RootRoute extends StatefulShellRouteData {
  const RootRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return RootPage(shell: navigationShell);
  }
}

class AttendanceRoute extends GoRouteData {
  const AttendanceRoute();
  static const path = '/attendance';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AttendanceListView();
  }
}

class ScheduleRoute extends GoRouteData {
  const ScheduleRoute();
  static const path = '/';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SchedulePage();
  }
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();
  static const path = 'settings';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
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

class NotificationSettingsRoute extends GoRouteData {
  const NotificationSettingsRoute();
  static const path = 'notification';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationSettingsPage();
  }
}

class QrSettingsRoute extends GoRouteData {
  const QrSettingsRoute();
  static const path = 'qr';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const QRSettingsPage();
  }
}
