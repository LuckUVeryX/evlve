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
            final details = schedule.event.classDetails;

            return CheckboxListTile(
              tristate: true,
              value: details.isCP ? null : details.isBookedByMe,
              onChanged: !details.canBook ? null : (value) {},
              title: Text(
                schedule.title,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colorScheme.onSurface),
              ),
              subtitle: Text(
                schedule.start.toIso8601String(),
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.colorScheme.onSurfaceVariant),
              ),
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
