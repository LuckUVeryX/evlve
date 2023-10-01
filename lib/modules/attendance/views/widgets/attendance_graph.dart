import 'package:evlve/modules/attendance/attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceGraph extends ConsumerWidget {
  const AttendanceGraph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(allAttendanceProvider);
    return value.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final attendance = data[index];
            return AttendanceListItem(index: index, attendance: attendance);
          },
        );
      },
      error: (error, stackTrace) => Text(
        error.toString(),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
