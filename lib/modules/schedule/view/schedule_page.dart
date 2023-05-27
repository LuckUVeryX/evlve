import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SfCalendar(
          timeSlotViewSettings: const TimeSlotViewSettings(
            startHour: 5,
          ),
        ),
      ),
    );
  }
}
