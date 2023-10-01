import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/utils/date_utils.dart';
import 'package:evlve/utils/iterable_utils.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

class AttendanceGraph extends ConsumerWidget {
  const AttendanceGraph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingSat = DateTime.now().upcomingSat();
    final value = ref.watch(allAttendanceDayProvider);
    return value.when(
      data: (attendances) {
        // End nicely on a sunday
        final earliestDate = attendances.keys.last
            .upcomingSat()
            .subtract(const Duration(days: 6));

        return Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
            padding: const EdgeInsets.only(right: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final row = index ~/ 8;
              final idxInRow = index % 8;
              final date = upcomingSat.subtract(
                Duration(days: index - row - DateTime.daysPerWeek),
              );

              if (idxInRow == DateTime.daysPerWeek) {
                final datesInRow = <DateTime>[];
                for (var i = 0; i < DateTime.daysPerWeek; i++) {
                  datesInRow.add(date.add(Duration(days: i + 1)));
                }
                final firstMonthDate =
                    datesInRow.firstWhereOrNull((e) => e.day == 1);
                if (firstMonthDate != null) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      intl.DateFormat.MMM().format(firstMonthDate),
                      style: context.textTheme.labelLarge,
                    ),
                  );
                }
                return const Offstage();
              }

              // Weekday Header
              if (index < DateTime.daysPerWeek) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    intl.DateFormat.E().format(date),
                    style: context.textTheme.labelLarge,
                  ),
                );
              }

              if (date.isBefore(earliestDate)) return null;

              final dayAttendance = attendances[date];
              final color = dayAttendance
                  ?.map((e) => e.level?.toLevel().color)
                  .mostFrequent;
              final opacity = min(2, dayAttendance?.length ?? 0) / 2;

              return NeuButton(
                backgroundColor: color?.withOpacity(opacity) ?? Colors.black,
                onPressed: () {
                  // TODO(Ryan): Show tool tip
                },
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
                    : () => ref.invalidate(allAttendanceDayProvider),
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
      loading: () => Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final date = upcomingSat.subtract(
              Duration(days: index - DateTime.daysPerWeek),
            );
            if (index < DateTime.daysPerWeek) {
              if (index.isEven) return const Offstage();
              return Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  intl.DateFormat.E().format(date),
                  style: context.textTheme.labelLarge,
                ),
              );
            }
            return const ShimmerWidget(
              child: NeuButton(
                backgroundColor: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
