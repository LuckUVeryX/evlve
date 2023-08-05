import 'package:evlve/theme/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleDateHeader extends StatelessWidget {
  const ScheduleDateHeader({required this.dt, super.key});

  final DateTime dt;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      color: context.colorScheme.primary,
      width: double.infinity,
      child: Text(
        DateFormat.MMMEd().format(dt),
        style: context.textTheme.bodyLarge
            ?.copyWith(color: context.colorScheme.onPrimary),
      ),
    );
  }
}
