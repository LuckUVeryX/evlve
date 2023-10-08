import 'package:evlve/modules/attendance/attendance.dart';
import 'package:flutter/material.dart';

class AttendanceListGrid extends StatelessWidget {
  const AttendanceListGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 60),
      children: [
        ...AttendanceGraphFilter.values.map((e) => AttendanceCard(filter: e)),
      ],
    );
  }
}
