import 'package:dio/dio.dart';
import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceListView extends ConsumerWidget {
  const AttendanceListView({super.key});

  static const _pageSize = 100;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(attendanceProvider);
        return ref.read(
          attendanceProvider(page: 0, limit: _pageSize).future,
        );
      },
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final page = index ~/ _pageSize;
          final indexInPage = index % _pageSize;

          final provider = attendanceProvider(limit: _pageSize, page: page);
          final attendanceList = ref.watch(provider);

          return attendanceList.unwrapPrevious().when(
                loading: () => const AttendanceListItemShimmer(),
                error: (e, st) {
                  if (indexInPage != 0) return null;
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
                          onPressed: () => ref.invalidate(provider),
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
    );
  }
}
