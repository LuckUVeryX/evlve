import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/controllers/schedule_date_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RootPage extends ConsumerWidget {
  const RootPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrController = qRControllerProvider(context);
    ref.watch(qrController);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          final tapCurrentIndex = navigationShell.currentIndex == index;

          navigationShell.goBranch(index, initialLocation: tapCurrentIndex);

          if (navigationShell.currentIndex == 0 && tapCurrentIndex) {
            ref.read(scheduleDateControllerProvider.notifier).resetDate();
          }
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.calendar_month),
            label: context.l10n.bottomNavSchedule,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: context.l10n.bottomNavSettings,
          ),
        ],
      ),
    );
  }
}
