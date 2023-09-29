import 'package:evlve/modules/attendance/attendance.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AttendanceListView(),
    );
  }
}
