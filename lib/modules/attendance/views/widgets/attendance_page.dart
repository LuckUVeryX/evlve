import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
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
  Widget build(BuildContext context) {
    ref.listen(
      attendanceScrollControllerProvider,
      (_, __) => _controller.animateTo(
        0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      ),
    );

    final view = ref.watch(attendanceViewControllerProvider);

    return Scaffold(
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar.large(
              pinned: false,
              title: GestureDetector(
                onTap: () {
                  ref
                      .read(attendanceScrollControllerProvider.notifier)
                      .scrollToTop();
                },
                child: Text(context.l10n.attendance),
              ),
              actions: [
                IconButton(
                  onPressed: ref
                      .read(attendanceViewControllerProvider.notifier)
                      .onToggle,
                  icon: Icon(view.icon),
                ),
              ],
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
