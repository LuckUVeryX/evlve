import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceCardInfo extends ConsumerWidget {
  const AttendanceCardInfo({
    required this.filter,
    super.key,
  });

  final AttendanceGraphFilter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = attendanceDayProvider(filter: filter);
    final attendanceDay = ref.watch(provider);

    return attendanceDay.when(
      error: (error, stackTrace) => ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        title: Text(
          'error',
          style: context.textTheme.bodySmall
              ?.copyWith(color: context.colorScheme.error),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.refresh,
            color: context.colorScheme.error,
          ),
          onPressed: () => ref.refresh(provider),
        ),
      ),
      loading: () => ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        title: Container(
          height: context.textTheme.titleLarge?.fontSize,
        ),
      ),
      data: (attendanceDays) {
        final attendances = attendanceDays.values.fold(
          <AttendanceState>[],
          (prev, next) => [...prev, ...next],
        );

        final streak = attendances.streak;
        final currStreak = streak.curr;

        return ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          leading: filter.leading,
          title: Text(filter.label),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$currStreak'),
              const Icon(Icons.local_fire_department),
            ],
          ),
        );
      },
    );
  }
}
