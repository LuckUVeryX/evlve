import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:evlve/app/app.dart';
import 'package:evlve/modules/schedule/controllers/schedule_date_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CalendarTimeline(
              leftMargin: 16,
              initialDate: ref.watch(scheduleDateControllerProvider),
              firstDate: now.subtract(const Duration(days: 100)),
              lastDate: now.add(const Duration(days: 100)),
              onDateSelected: ref
                  .read(scheduleDateControllerProvider.notifier)
                  .onDateSelected,
              activeDayColor: context.colorScheme.onPrimary,
              activeBackgroundDayColor: context.colorScheme.primary,
              dayColor: context.colorScheme.secondary,
              monthColor: context.colorScheme.secondary,
            )
          ],
        ),
      ),
    );
  }
}
