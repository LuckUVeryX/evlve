import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facility = ref.watch(scheduleFacilityControllerProvider);
    final areas = facility.areas;

    ref.listen(
      shakeEventProvider,
      (_, __) async {
        if (ModalRoute.of(context)?.isCurrent != true) return;
        ref.read(setMaxBrightnessProvider);
        await QRDialog.show(context);
        ref.read(resetBrightnessProvider);
      },
    );

    return DefaultTabController(
      length: areas.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => [const ScheduleAppBar()],
          body: const ScheduleInfiniteList(),
        ),
      ),
    );
  }
}
