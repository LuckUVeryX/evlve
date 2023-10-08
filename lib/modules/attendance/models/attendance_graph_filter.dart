import 'package:evlve/app/theme/app_theme.dart';
import 'package:evlve/app/views/views.dart';
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
      AttendanceGraphFilter.others => Level.wrestling.color,
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

  Widget get leading {
    return switch (this) {
      AttendanceGraphFilter.all => const EvolveLogo(),
      AttendanceGraphFilter.muayThai => const Icon(Icons.sports_martial_arts),
      AttendanceGraphFilter.boxing => const Icon(Icons.sports_mma),
      AttendanceGraphFilter.bjj => const Icon(Icons.sports_kabaddi),
      AttendanceGraphFilter.others => const Icon(Icons.fitness_center),
    };
  }

  String get label {
    return switch (this) {
      AttendanceGraphFilter.all => 'All',
      AttendanceGraphFilter.muayThai => 'Muay Thai',
      AttendanceGraphFilter.boxing => 'Boxing',
      AttendanceGraphFilter.bjj => 'Brazilian Jiu Jitsu',
      AttendanceGraphFilter.others => 'Others'
    };
  }
}
