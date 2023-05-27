import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(scheduleDateControllerProvider);
    final provider = scheduleProvider(
      date: date,
      area: Area.kinexMt,
    );

    ref.listenErrors([provider]);

    final value = ref.watch(provider);
    return Scaffold(
      body: SafeArea(
        child: SfCalendar(
          timeSlotViewSettings:
              const TimeSlotViewSettings(startHour: 5, endHour: 23),
          dataSource: ScheduleDataSource(
            value.whenOrNull(data: (data) => data.schedules) ?? [],
          ),
          onViewChanged:
              ref.read(scheduleDateControllerProvider.notifier).onViewChanged,
        ),
      ),
    );
  }
}
