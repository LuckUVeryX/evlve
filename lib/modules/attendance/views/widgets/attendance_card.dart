import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:evlve/app/views/views.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/utils/date_utils.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AttendanceCard extends ConsumerWidget {
  const AttendanceCard({
    required this.filter,
    super.key,
  });

  final AttendanceGraphFilter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const height = 160.0;
    const margin = EdgeInsets.symmetric(vertical: 8);
    final backgroundColor = context.colorScheme.surface;
    final value = ref.watch(AttendanceDayProvider(filter: filter));

    return value.when(
      error: (e, st) => NeuContainer(
        height: height,
        margin: margin,
        color: backgroundColor,
        child: Column(
          children: [
            const SizedBox(width: double.infinity),
            NeuTextButton(
              backgroundColor: context.colorScheme.error,
              onPressed: value.isLoading
                  ? null
                  : () => ref.invalidate(attendanceDayProvider),
              label: context.l10n.retry,
            ),
            const SizedBox.square(dimension: 12),
            Text(
              (e is DioException) ? e.message ?? e.toString() : e.toString(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
      loading: () => ShimmerWidget(
        child: NeuContainer(
          height: height,
          margin: margin,
          color: backgroundColor,
        ),
      ),
      data: (attendances) {
        const minCount = 350;
        final now = DateTime.now().stripTime();
        final attendanceCount =
            now.difference(attendances.keys.lastOrNull ?? now).inDays;

        return NeuContainer(
          color: backgroundColor,
          height: height,
          margin: margin,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AttendanceCardInfo(filter: filter),
              Expanded(
                child: GridView.builder(
                  primary: false,
                  reverse: true,
                  padding: const EdgeInsets.all(2),
                  scrollDirection: Axis.horizontal,
                  itemCount: max(minCount, (attendanceCount ~/ 7 + 1) * 7),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: DateTime.daysPerWeek,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    final date = now.subtract(Duration(days: index));
                    final dayAttendance = attendances[date] ?? [];
                    final opacity = max(min(2, dayAttendance.length) / 2, 0.1);
                    final color = filter.color.withOpacity(opacity);

                    final child = NeuContainer(
                      shadow: false,
                      color: color,
                      border: const Border(),
                    );

                    if (dayAttendance.isEmpty) return child;

                    return Tooltip(
                      message: [
                        ...dayAttendance
                            .map((e) => '${e.facility.key} ${e.name}'),
                        DateFormat.yMMMMd().format(date),
                      ].join('\n'),
                      preferBelow: false,
                      textAlign: TextAlign.center,
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
