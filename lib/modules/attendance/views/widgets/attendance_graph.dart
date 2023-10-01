import 'dart:math';

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
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar.large(
            title: Text(context.l10n.attendance),
            pinned: false,
          ),
        ];
      },
      body: const _AttendanceGridView(),
    );
  }
}

class _AttendanceGridView extends ConsumerWidget {
  const _AttendanceGridView();

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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final date = upcomingSat.subtract(
                Duration(days: index - DateTime.daysPerWeek),
              );

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

              return NeuContainer(
                color: color?.withOpacity(opacity),
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
              child: NeuContainer(
                color: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
