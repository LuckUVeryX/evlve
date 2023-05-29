import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:evlve/app/app.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleDayPicker extends ConsumerWidget {
  const ScheduleDayPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();

    return CalendarTimeline(
      leftMargin: 16,
      initialDate: ref.watch(scheduleDateControllerProvider),
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 2),
      onDateSelected:
          ref.read(scheduleDateControllerProvider.notifier).onDateSelected,
      activeDayColor: context.colorScheme.onPrimary,
      activeBackgroundDayColor: context.colorScheme.primary,
      dayColor: context.colorScheme.secondary,
      monthColor: context.colorScheme.secondary,
    );
  }
}
