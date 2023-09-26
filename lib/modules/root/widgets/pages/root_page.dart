import 'package:evlve/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    required this.shell,
    super.key,
  });

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: shell.goBranch,
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(Icons.calendar_month),
            icon: const Icon(Icons.calendar_month_outlined),
            label: context.l10n.booking,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.timeline),
            icon: const Icon(Icons.timeline_outlined),
            label: context.l10n.attendance,
          ),
        ],
      ),
    );
  }
}
