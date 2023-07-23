import 'package:evlve/app/router/router.listenable.dart';
import 'package:evlve/app/router/router.routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
Raw<GoRouter> router(RouterRef ref) {
  final notifier = ref.watch(routerListenableProvider.notifier);
  final router = GoRouter(
    routes: Routes.routes,
    navigatorKey: _key,
    debugLogDiagnostics: true,
    redirect: notifier.redirect,
    refreshListenable: notifier,
    initialLocation: Routes.splash,
  );
  ref.onDispose(router.dispose);
  return router;
}
