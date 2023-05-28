import 'package:evlve/app/app.dart';
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
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                title: const ScheduleDayPicker(),
                toolbarHeight: kToolbarHeight + 44,
                bottom: TabBar(
                  tabs: [
                    for (final area in facility.areas) Tab(text: area.key.key)
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              for (final area in areas)
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final provider = scheduleProvider(
                      area: area.key,
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
