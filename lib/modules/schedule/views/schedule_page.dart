import 'package:evlve/modules/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facility = ref.watch(scheduleFacilityControllerProvider);
    final areas = facility.areas;

    return DefaultTabController(
      length: areas.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => [const ScheduleAppBar()],
          body: TabBarView(
            children: [
              for (final area in areas) ScheduleListView(area: area.key)
            ],
          ),
        ),
      ),
    );
  }
}
