import 'package:evlve/app/theme/app_theme.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:flutter/material.dart';

enum AttendanceGraphFilter { all, muayThai, boxing, bjj, others }

extension AttendanceLevelTypeX on AttendanceGraphFilter {
  Color get color {
    return switch (this) {
      AttendanceGraphFilter.all => AppTheme.seedColor,
      AttendanceGraphFilter.muayThai => Level.mtLevel1.color,
      AttendanceGraphFilter.boxing => Level.boxingLevel1.color,
      AttendanceGraphFilter.bjj => Level.bjjBlue.color,
      AttendanceGraphFilter.others => Level.warriorFit.color,
    };
  }

  IconData get icon {
    return switch (this) {
      AttendanceGraphFilter.all => Icons.tune,
      AttendanceGraphFilter.muayThai => Icons.sports_martial_arts,
      AttendanceGraphFilter.boxing => Icons.sports_mma,
      AttendanceGraphFilter.bjj => Icons.sports_kabaddi,
      AttendanceGraphFilter.others => Icons.fitness_center,
    };
  }
}
