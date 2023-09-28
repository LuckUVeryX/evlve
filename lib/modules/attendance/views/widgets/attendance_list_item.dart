import 'package:evlve/app/app.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';

class AttendanceListItem extends StatelessWidget {
  const AttendanceListItem({
    required this.index,
    required this.attendance,
    super.key,
  });

  final int index;
  final AttendanceState attendance;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor:
              attendance.level?.toLevel().color ?? context.colorScheme.primary,
          brightness: context.theme.brightness,
        ),
        useMaterial3: true,
        textTheme: context.textTheme,
      ),
      child: Builder(
        builder: (context) {
          return NeuContainer(
            margin: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            color: context.colorScheme.primary,
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              textColor: context.colorScheme.onPrimary,
              title: Text(attendance.name),
              subtitle: Text(
                '${attendance.facility.key} ${attendance.startTime}',
              ),
              trailing: Text('${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}

class AttendanceListItemShimmer extends StatelessWidget {
  const AttendanceListItemShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: NeuContainer(
          color: Colors.white,
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            title: SizedBox(
              height: context.textTheme.bodyLarge?.fontSize,
            ),
            subtitle: SizedBox(
              height: context.textTheme.bodyMedium?.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
