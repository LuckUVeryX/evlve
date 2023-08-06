import 'package:evlve/theme/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleDateHeader extends StatelessWidget {
  const ScheduleDateHeader({required this.dt, super.key});

  final DateTime dt;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
        child: Text(
          DateFormat.MMMEd().format(dt),
          style: context.textTheme.headlineLarge?.copyWith(
            color: context.colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
