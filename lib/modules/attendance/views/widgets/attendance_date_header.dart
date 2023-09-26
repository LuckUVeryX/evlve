import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceDateHeader extends StatelessWidget {
  const AttendanceDateHeader({
    required this.date,
    super.key,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
      child: Text(
        DateFormat.yMMMEd().format(date),
        style: context.textTheme.headlineSmall?.copyWith(
          color: context.colorScheme.onBackground,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
