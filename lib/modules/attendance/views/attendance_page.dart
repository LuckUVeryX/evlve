import 'package:evlve/modules/attendance/attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendancePage extends ConsumerWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceResponse =
        ref.watch(attendanceProvider(limit: 100, offset: 0));
    return ListView.builder(
      itemBuilder: (context, index) {
        final attendances = attendanceResponse.valueOrNull?.attendances ?? [];
        if (index >= attendances.length) {
          return null;
        }
        final attendance = attendances[index];
        return ListTile(
          title: Text(attendance.toString()),
        );
      },
    );
  }
}
