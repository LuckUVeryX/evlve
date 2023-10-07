import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/utils/date_utils.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

class AttendanceGraph extends ConsumerWidget {
  const AttendanceGraph({super.key});

  static const _crossAxisCount = DateTime.daysPerWeek * 2 + 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphFilter = ref.watch(attendanceGraphFilterControllerProvider);

    final upcomingSat = DateTime.now().upcomingSat();
    final value = ref.watch(attendanceDayProvider(filter: graphFilter));
    return value.when(
      data: (attendances) {
        // Starts nicely on a sunday from the left
        final earliestDate =
            (attendances.keys.lastOrNull ?? DateTime.now()).stripTime();

        return Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
            padding: const EdgeInsets.only(right: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              final row = index ~/ _crossAxisCount;
              final idxInRow = index % _crossAxisCount;

              // First date displayed is upcomingSat's date.
              // We add an additional row on top for Weekday label
              final date = upcomingSat
                  .subtract(Duration(days: index - row - _crossAxisCount + 1));

              if (date.isBefore(earliestDate)) return null;

              // * Month Label
              if (idxInRow == _crossAxisCount - 1) {
                final datesInRow = <DateTime>[];
                for (var i = 1; i < _crossAxisCount; i++) {
                  datesInRow.add(date.add(Duration(days: i)));
                }
                final firstMonthDate =
                    datesInRow.firstWhereOrNull((e) => e.day == 1);
                if (firstMonthDate != null) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      intl.DateFormat.MMM().format(firstMonthDate),
                      style: context.textTheme.labelSmall,
                    ),
                  );
                }
                return const Offstage();
              }

              // * Weekday Header
              if (row == 0) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    intl.DateFormat.E().format(date).characters.first,
                    textAlign: TextAlign.center,
                    style: context.textTheme.labelSmall,
                  ),
                );
              }

              final dayAttendance = attendances[date] ?? [];
              final color = graphFilter.color;
              final opacity = max(min(2, dayAttendance.length) / 2, 0.05);
              var border = const Border();
              if (date == DateTime.now().stripTime()) {
                border = Border.all(width: 2);
              }

              return Tooltip(
                message: [
                  ...dayAttendance.map((e) => '${e.facility.key} ${e.name}'),
                  intl.DateFormat.yMMMMd().format(date),
                ].join('\n'),
                preferBelow: false,
                textAlign: TextAlign.center,
                showDuration: const Duration(seconds: 3),
                child: NeuContainer(
                  shadow: false,
                  border: border,
                  color: color.withOpacity(opacity),
                ),
              );
            },
          ),
        );
      },
      error: (e, st) {
        return Padding(
          padding: const EdgeInsets.all(16),
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
        );
      },
      loading: () {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
            padding: const EdgeInsets.only(right: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              final row = index ~/ _crossAxisCount;
              final idxInRow = index % _crossAxisCount;

              // First date displayed is upcomingSat's date.
              // We add an additional row on top for Weekday label
              final date = upcomingSat
                  .subtract(Duration(days: index - row - _crossAxisCount + 1));

              // * Month Label
              if (idxInRow == _crossAxisCount - 1) {
                final datesInRow = <DateTime>[];
                for (var i = 1; i < _crossAxisCount; i++) {
                  datesInRow.add(date.add(Duration(days: i)));
                }
                final firstMonthDate =
                    datesInRow.firstWhereOrNull((e) => e.day == 1);
                if (firstMonthDate != null) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      intl.DateFormat.MMM().format(firstMonthDate),
                      style: context.textTheme.labelSmall,
                    ),
                  );
                }
                return const Offstage();
              }

              // * Weekday Header
              if (row == 0) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    intl.DateFormat.E().format(date).characters.first,
                    textAlign: TextAlign.center,
                    style: context.textTheme.labelSmall,
                  ),
                );
              }

              return const ShimmerWidget(
                child: NeuContainer(
                  shadow: false,
                  color: Colors.black,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
