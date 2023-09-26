import 'package:evlve/app/router/router_listenable.dart';
import 'package:evlve/app/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
Raw<GoRouter> router(RouterRef ref) {
  final notifier = ref.watch(routerListenableProvider.notifier);
  final router = GoRouter(
    routes: $appRoutes,
    navigatorKey: rootKey,
    debugLogDiagnostics: true,
    redirect: notifier.redirect,
    refreshListenable: notifier,
    initialLocation: SplashRoute.path,
  );
  ref.onDispose(router.dispose);
  return router;
}
