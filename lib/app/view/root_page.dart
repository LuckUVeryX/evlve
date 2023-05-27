import 'package:evlve/app/controllers/controllers.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/schedule/controllers/schedule_date_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    required this.navigator,
    super.key,
  });

  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigator,
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends ConsumerWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavControllerProvider);

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        ref
            .read(bottomNavControllerProvider.notifier)
            .onDestinationSelected(value);

        if (selectedIndex == 0 && selectedIndex == value) {
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
    );
  }
}
