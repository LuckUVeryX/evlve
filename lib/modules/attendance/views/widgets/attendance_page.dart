import 'package:evlve/app/app.dart';
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
              AttendanceStats(text: 'Current Streak: $currStreak')
            else
              const AttendanceStatsShimmer(),
            if (longestStreak != null)
              AttendanceStats(
                text: 'Longest Streak: $longestStreak',
              )
            else
              const AttendanceStatsShimmer(),
            if (daysAttended != null)
              AttendanceStats(
                text: '$daysAttended/$daysSinceFirstClass Days Attended',
              )
            else
              const AttendanceStatsShimmer(flex: 3),
            if (daysSinceFirstClass != null)
              AttendanceStats(
                text: '$length Classes in $daysSinceFirstClass Days',
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

class AttendanceStatsShimmer extends StatelessWidget {
  const AttendanceStatsShimmer({
    this.flex = 1,
    super.key,
  });

  final int flex;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      sliver: SliverToBoxAdapter(
        child: ShimmerWidget(
          child: Row(
            children: [
              Expanded(
                flex: flex,
                child: Container(
                  color: Colors.black,
                  height: context.textTheme.headlineSmall?.fontSize,
                  width: double.infinity,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceStats extends StatelessWidget {
  const AttendanceStats({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: context.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
