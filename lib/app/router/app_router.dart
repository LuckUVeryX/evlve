import 'package:evlve/app/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
Raw<GoRouter> router(RouterRef ref) {
  final notifier = ref.watch(routerListenableProvider.notifier);
  return GoRouter(
    routes: $appRoutes,
    navigatorKey: _key,
    debugLogDiagnostics: true,
    redirect: notifier.redirect,
    refreshListenable: notifier,
    initialLocation: SplashRoute.path,
  );
}
