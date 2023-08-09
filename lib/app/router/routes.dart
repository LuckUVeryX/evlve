import 'package:evlve/app/app.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/modules/qr/qr.dart';
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

@TypedGoRoute<ScheduleRoute>(path: ScheduleRoute.path)
class ScheduleRoute extends GoRouteData {
  const ScheduleRoute();
  static const path = '/';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SchedulePage();
  }
}

@TypedGoRoute<SettingsRoute>(
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
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();
  static const path = '/settings';
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

// class Routes {
//   const Routes._();

//   static final routes = [
//     _splashRoute,
//     _authRoute,
//     _scheduleRoute,
//     _settingsRoute,
//   ];

//   static const splash = '/splash';

//   static const auth = '/auth';
//   static const otp = '/auth/otp';

//   static const schedule = '/';

//   static const settings = '/settings';
//   static const accountSettings = '/settings/account';
//   static const notification = '/settings/notification';
//   static const qr = '/settings/qr';

//   static final _splashRoute = GoRoute(
//     path: Routes.splash,
//     builder: (context, state) => const SplashPage(),
//   );

//   static final _authRoute = GoRoute(
//     path: Routes.auth,
//     builder: (context, state) => const SigninPage(),
//     routes: [_otpRoute],
//   );

//   static final _otpRoute = GoRoute(
//     path: Routes.otp,
//     builder: (context, state) => const OtpPage(),
//   );

//   static final _scheduleRoute = GoRoute(
//     path: Routes.schedule,
//     builder: (context, state) => const SchedulePage(),
//     routes: [_settingsRoute],
//   );

//   static final _settingsRoute = GoRoute(
//     path: Routes.settings,
//     builder: (context, state) => const SettingsPage(),
//     routes: [
//       _accountsSettingsRoute,
//       _notificationSettingsRoute,
//       _qrSettingsRoute,
//     ],
//   );

//   static final _accountsSettingsRoute = GoRoute(
//     path: Routes.accountSettings,
//     builder: (context, state) => const AccountSettingsPage(),
//   );

//   static final _notificationSettingsRoute = GoRoute(
//     path: Routes.notification,
//     builder: (context, state) => const NotificationSettingsPage(),
//   );

//   static final _qrSettingsRoute = GoRoute(
//     path: Routes.qr,
//     builder: (context, state) => const QRSettingsPage(),
//   );
// }
