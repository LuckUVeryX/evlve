import 'package:evlve/app/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_controller.g.dart';

@riverpod
class BottomNavController extends _$BottomNavController {
  final _routes = <String>[HomeRoute.path, SettingsRoute.path];

  @override
  int build() {
    return 0;
  }

  void onDestinationSelected(int value) {
    if (state == value) return;

    state = value;
    ref.read(routerProvider).go(_routes[value]);
  }
}
