import 'package:evlve/app/app.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleListView extends ConsumerWidget {
  const ScheduleListView({
    required this.area,
    super.key,
  });

  final Area area;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final provider = scheduleProvider(
          area: area,
          date: ref.watch(scheduleDateControllerProvider),
        );
        final scheduleValue = ref.watch(provider);

        return scheduleValue.when(
          data: (scheduleList) {
            final schedules = scheduleList.schedules;
            if (index >= schedules.length) return null;
            final schedule = scheduleList.schedules[index];
            return ListTile(
              title: Text(schedule.title),
              textColor: context.colorScheme.onBackground,
              subtitle: Text(schedule.start.toIso8601String()),
            );
          },
          error: (e, st) {
            return index == 0 ? Text(e.toString()) : null;
          },
          loading: () {
            return index == 0
                ? const Center(child: CircularProgressIndicator())
                : null;
          },
        );
      },
    );
  }
}
