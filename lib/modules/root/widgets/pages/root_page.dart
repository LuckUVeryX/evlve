import 'package:evlve/app/router/routes.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RootPage extends ConsumerWidget {
  const RootPage({
    required this.shell,
    super.key,
  });

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      shakeEventProvider,
      (_, __) async {
        if (ModalRoute.of(context)?.isCurrent != true) return;
        await QRDialog.show(ref);
      },
    );

    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (value) {
          shell.goBranch(value, initialLocation: value == shell.currentIndex);

          final path = GoRouterState.of(context).fullPath;

          final scheduleDestinationTap = value == 0;
          final atScheduleDestination = path == ScheduleRoute.path;

          if (scheduleDestinationTap && atScheduleDestination) {
            ref.read(resetDateControllerProvider.notifier).resetDate();
          }

          final attendenceDestinationTap = value == 1;
          final atAttendanceDestination = path == AttendanceRoute.path;

          if (attendenceDestinationTap && atAttendanceDestination) {
            ref.read(attendanceScrollControllerProvider.notifier).scrollToTop();
          }
        },
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
