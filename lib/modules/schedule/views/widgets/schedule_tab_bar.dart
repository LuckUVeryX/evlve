import 'package:evlve/app/app.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleTabBar extends ConsumerWidget {
  const ScheduleTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facility = ref.watch(facilityContollerProvider);
    final areas = facility.areas;

    return NeuContainer(
      color: context.colorScheme.background,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(4),
      child: TabBar(
        onTap: (_) {
          final indexIsChanging =
              DefaultTabController.of(context).indexIsChanging;
          if (indexIsChanging) return;
          ref.read(resetDateControllerProvider.notifier).resetDate();
        },
        tabs: [for (final area in areas) Tab(text: area.key.key)],
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: context.colorScheme.primary,
          border: Border.all(width: 4),
          borderRadius: BorderRadius.circular(2),
        ),
        labelColor: context.colorScheme.onPrimary,
        unselectedLabelColor: context.colorScheme.onBackground,
      ),
    );
  }
}
