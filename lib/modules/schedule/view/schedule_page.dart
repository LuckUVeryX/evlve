import 'package:evlve/app/app.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final i = index - 1; // Account for the [ScheduleDayPicker].
          if (index == 0) return const SafeArea(child: ScheduleDayPicker());

          final provider = scheduleProvider(
            area: Area.kinexMt,
            date: ref.watch(scheduleDateControllerProvider),
          );
          final scheduleValue = ref.watch(provider);

          return scheduleValue.when(
            data: (scheduleList) {
              final schedules = scheduleList.schedules;
              if (i >= schedules.length) return null;
              final schedule = scheduleList.schedules[i];
              return ListTile(
                title: Text(schedule.title),
                textColor: context.colorScheme.onBackground,
                subtitle: Text(schedule.start.toIso8601String()),
              );
            },
            error: (e, st) {
              return i == 0 ? Text(e.toString()) : null;
            },
            loading: () {
              return i == 0
                  ? const Center(child: CircularProgressIndicator())
                  : null;
            },
          );
        },
      ),
    );
  }
}
