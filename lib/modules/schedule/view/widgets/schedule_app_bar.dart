import 'package:evlve/modules/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleAppBar extends ConsumerWidget {
  const ScheduleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facility = ref.watch(scheduleFacilityControllerProvider);
    final areas = facility.areas;

    return SliverAppBar(
      pinned: true,
      floating: true,
      titleSpacing: 0,
      title: const ScheduleDayPicker(),
      toolbarHeight: kToolbarHeight + 44,
      bottom: TabBar(
        tabs: [for (final area in areas) Tab(text: area.key.key)],
      ),
    );
  }
}
