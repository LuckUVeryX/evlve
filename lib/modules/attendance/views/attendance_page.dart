import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/attendance/views/widgets/attendance_date_header.dart';
import 'package:evlve/modules/attendance/views/widgets/attendance_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendancePage extends ConsumerWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const pageSize = 100;

    return CustomScrollView(
      slivers: [
        SliverAppBar.large(title: Text(context.l10n.attendance)),
        SliverList.builder(
          itemBuilder: (context, index) {
            final page = index ~/ pageSize;
            final indexInPage = index % pageSize;
            final attendanceList = ref.watch(
              attendanceProvider(limit: pageSize, page: page),
            );

            return attendanceList.when(
              loading: () => const AttendanceListItemShimmer(),
              error: (e, st) {
                if (indexInPage != 0) return null;
                return Text('Error $e');
              },
              data: (attendances) {
                if (indexInPage >= attendances.length) return null;
                final attendance = attendances[indexInPage];

                final showDateHeader = indexInPage == 0 ||
                    attendance.date != attendances[indexInPage - 1].date;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showDateHeader)
                      AttendanceDateHeader(date: attendance.date),
                    AttendanceListItem(
                      index: index + 1,
                      attendance: attendance,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
