import 'dart:math';

import 'package:collection/collection.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendancePage extends ConsumerStatefulWidget {
  const AttendancePage({super.key});

  @override
  ConsumerState<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends ConsumerState<AttendancePage> {
  late final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final view = ref.watch(attendanceViewControllerProvider);
    final graphFilter = ref.watch(attendanceGraphFilterControllerProvider);

    return Scaffold(
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          final attendanceDay =
              ref.watch(attendanceDayProvider(filter: graphFilter)).valueOrNull;
          final attendances = attendanceDay?.values.fold(
            <AttendanceState>[],
            (prev, next) => [...prev, ...next],
          );

          final streak = attendances?.streak;
          final currStreak = streak?.curr;
          final longestStreak = streak?.longest;
          final classesAttended = attendances?.length;

          final classEachDay = attendanceDay?.values.map((e) => e.length);
          final avgClassPerDay = classEachDay == null
              ? null
              : classEachDay.isEmpty
                  ? -1
                  : classEachDay.average;
          final maxClassPerDay = classEachDay == null
              ? null
              : classEachDay.isEmpty
                  ? -1
                  : classEachDay.reduce(max);
          final daysAttended = attendanceDay?.keys.length;
          final daysSinceFirstClass = attendances?.daysSinceFirstClass;

          return [
            SliverAppBar.large(
              pinned: false,
              floating: true,
              title: Text(context.l10n.attendance),
              actions: [
                if (view == AttendanceView.grid)
                  IconButton(
                    onPressed: ref
                        .read(attendanceGraphFilterControllerProvider.notifier)
                        .onToggle,
                    icon: Icon(graphFilter.icon),
                  ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(attendanceGraphFilterControllerProvider.notifier)
                        .reset();
                    ref
                        .read(attendanceViewControllerProvider.notifier)
                        .onToggle();
                  },
                  icon: Icon(view.icon),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Text(
                  graphFilter == AttendanceGraphFilter.all
                      ? ''
                      : graphFilter.name.toUpperCase(),
                  style: context.textTheme.titleSmall,
                ),
              ),
            ),
            if (currStreak != null)
              AttendanceStats(text: 'Current Streak: $currStreak')
            else
              const AttendanceStatsShimmer(),
            if (longestStreak != null)
              AttendanceStats(
                text: 'Longest Streak: $longestStreak',
              )
            else
              const AttendanceStatsShimmer(),
            if (maxClassPerDay != null) ...[
              if (maxClassPerDay != -1)
                AttendanceStats(
                  text: 'Max $maxClassPerDay Classes/Day',
                ),
            ] else
              const AttendanceStatsShimmer(flex: 2),
            if (avgClassPerDay != null) ...[
              if (avgClassPerDay != -1)
                AttendanceStats(
                  text: 'Avg ${avgClassPerDay.toStringAsFixed(2)} Classes/Day',
                ),
            ] else
              const AttendanceStatsShimmer(flex: 2),
            if (daysAttended != null)
              AttendanceStats(
                text: '$daysAttended/$daysSinceFirstClass Days Attended',
              )
            else
              const AttendanceStatsShimmer(flex: 3),
            if (daysSinceFirstClass != null)
              AttendanceStats(
                text: '$classesAttended Classes in $daysSinceFirstClass Days',
              )
            else
              const AttendanceStatsShimmer(flex: 3),
          ];
        },
        body: switch (view) {
          AttendanceView.list => const AttendanceListView(),
          AttendanceView.grid => const AttendanceGraph(),
        },
      ),
      // body: AttendanceListView(),
    );
  }
}
