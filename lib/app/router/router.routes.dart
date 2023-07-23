import 'package:evlve/app/app.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/settings/settings.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/theme/theme.dart';
import 'package:go_router/go_router.dart';

class Routes {
  const Routes._();

  static final routes = [
    _splashRoute,
    _authRoute,
    _rootRoute,
  ];

  static const splash = '/splash';

  static const auth = '/auth';
  static const otp = 'otp';

  static const schedule = '/';

  static const settings = '/settings';
  static const accountSettings = 'account';
  static const notification = 'notification';
  static const theme = 'theme';
  static const qr = 'qr';

  static final _splashRoute = GoRoute(
    path: Routes.splash,
    builder: (context, state) => const SplashPage(),
  );

  static final _authRoute = GoRoute(
    path: Routes.auth,
    builder: (context, state) => const SigninPage(),
    routes: [_otpRoute],
  );

  static final _otpRoute = GoRoute(
    path: Routes.otp,
    builder: (context, state) => const OTPPage(),
  );

  static final _rootRoute = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return RootPage(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(routes: [_scheduleRoute]),
      StatefulShellBranch(routes: [_settingsRoute]),
    ],
  );

  static final _scheduleRoute = GoRoute(
    path: Routes.schedule,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: SchedulePage(),
    ),
  );

  static final _settingsRoute = GoRoute(
    path: Routes.settings,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: SettingsPage(),
    ),
    routes: [
      _accountsSettingsRoute,
      _notificationSettingsRoute,
      _themeSettingsRoute,
      _qrSettingsRoute,
    ],
  );

  static final _accountsSettingsRoute = GoRoute(
    path: Routes.accountSettings,
    builder: (context, state) => const AccountSettingsPage(),
  );

  static final _notificationSettingsRoute = GoRoute(
    path: Routes.notification,
    builder: (context, state) => const NotificationSettingsPage(),
  );

  static final _themeSettingsRoute = GoRoute(
    path: Routes.theme,
    builder: (context, state) => const ThemeSettingsPage(),
  );

  static final _qrSettingsRoute = GoRoute(
    path: Routes.qr,
    builder: (context, state) => const QRSettingsPage(),
  );
}
