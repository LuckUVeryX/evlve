import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      shakeEventProvider,
      (_, __) async {
        if (ModalRoute.of(context)?.isCurrent != true) return;
        await QRDialog.show(ref);
      },
    );

    final facility = ref.watch(facilityContollerProvider);
    final areas = facility.areas;

    return DefaultTabController(
      length: areas.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => [const ScheduleAppBar()],
          body: const ScheduleInfiniteList(),
        ),
        floatingActionButton: const QRFloatingActionButton(),
      ),
    );
  }
}
