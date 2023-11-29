import 'package:dio/dio.dart';
import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AttendanceListView extends ConsumerWidget {
  const AttendanceListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendance = ref.watch(attendanceProvider);

    return Scrollbar(
      child: RefreshIndicator(
        onRefresh: () async => ref.refresh(attendanceProvider),
        child: ListView.builder(
          itemCount: attendance.valueOrNull?.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return attendance.unwrapPrevious().when(
                  loading: () => const AttendanceListItemShimmer(),
                  error: (e, st) {
                    if (index != 0) return null;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          NeuTextButton(
                            backgroundColor: context.colorScheme.error,
                            onPressed: () => ref.invalidate(attendanceProvider),
                            label: context.l10n.retry,
                          ),
                          const SizedBox.square(dimension: 12),
                          Text(
                            (e is DioException)
                                ? e.message ?? e.toString()
                                : e.toString(),
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  data: (attendances) {
                    final attendance = attendances[index];

                    final showDateHeader = index == 0 ||
                        attendance.date != attendances[index - 1].date;

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
      ),
    );
  }
}
