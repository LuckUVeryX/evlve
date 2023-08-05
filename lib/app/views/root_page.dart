import 'package:evlve/app/router/router.routes.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/notifications/notifications.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/controllers/schedule_date_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RootPage extends ConsumerStatefulWidget {
  const RootPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await ref.read(resetBadgeCountProvider.future);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      shakeEventProvider,
      (_, __) async {
        if (ModalRoute.of(context)?.isCurrent != true) return;
        // Disable shake feature when adjusting QR code settings
        final router = GoRouterState.of(context);
        final inSettingsPage = router.matchedLocation.contains(Routes.settings);
        if (inSettingsPage) return;

        ref.read(setMaxBrightnessProvider);
        await QRDialog.show(context);
        ref.read(resetBrightnessProvider);
      },
    );

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (index) {
          final tapCurrentIndex = widget.navigationShell.currentIndex == index;

          widget.navigationShell
              .goBranch(index, initialLocation: tapCurrentIndex);

          if (widget.navigationShell.currentIndex == 0 && tapCurrentIndex) {
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
