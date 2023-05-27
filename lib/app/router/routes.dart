import 'package:evlve/app/app.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<SignInRoute>(path: SignInRoute.path)
class SignInRoute extends GoRouteData {
  static const path = '/auth';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SigninPage();
  }
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final auth = ref.watch(authControllerProvider);
              return auth.maybeWhen(
                loading: null,
                orElse: () => IconButton(
                  onPressed: () {
                    ref.read(authControllerProvider.notifier).logout();
                  },
                  icon: auth.maybeWhen(
                    loading: () => const CircularProgressIndicator(),
                    orElse: () => const Icon(Icons.logout),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
