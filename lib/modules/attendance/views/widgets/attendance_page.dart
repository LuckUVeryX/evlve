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

    return Scaffold(
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          final attendances = ref.watch(attendanceProvider).valueOrNull;
          final daysAttended = ref.watch(
            attendanceDayProvider
                .select((value) => value.valueOrNull?.keys.length),
          );

          final streak = attendances?.streak;
          final currStreak = streak?.curr;
          final longestStreak = streak?.longest;

          final length = attendances?.length;
          final daysSinceFirstClass = attendances?.daysSinceFirstClass;
          return [
            SliverAppBar.large(
              pinned: false,
              floating: true,
              title: Text(context.l10n.attendance),
              actions: [
                IconButton(
                  onPressed: ref
                      .read(attendanceViewControllerProvider.notifier)
                      .onToggle,
                  icon: Icon(view.icon),
                ),
              ],
            ),
            if (currStreak != null)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Current Streak: $currStreak',
                    style: context.textTheme.headlineSmall,
                  ),
                ),
              ),
            if (longestStreak != null)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Longest Streak: $longestStreak',
                    style: context.textTheme.headlineSmall,
                  ),
                ),
              ),
            if (daysAttended != null)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    '$daysAttended/$daysSinceFirstClass Days Attended',
                    style: context.textTheme.headlineSmall,
                  ),
                ),
              ),
            if (daysSinceFirstClass != null)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    '$length Classes in $daysSinceFirstClass Days',
                    style: context.textTheme.headlineSmall,
                  ),
                ),
              ),
          ];
        },
        body: () {
          return switch (view) {
            AttendanceView.list => const AttendanceListView(),
            AttendanceView.grid => const AttendanceGraph(),
          };
        }.call(),
      ),
      // body: AttendanceListView(),
    );
  }
}
