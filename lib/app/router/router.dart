import 'package:evlve/app/router/router_listenable.dart';
import 'package:evlve/app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
Raw<GoRouter> router(RouterRef ref) {
  final notifier = ref.watch(routerListenableProvider.notifier);
  final router = GoRouter(
    routes: $appRoutes,
    navigatorKey: _key,
    debugLogDiagnostics: true,
    redirect: notifier.redirect,
    refreshListenable: notifier,
    initialLocation: SplashRoute.path,
  );
  ref.onDispose(router.dispose);
  return router;
}
