import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleAppBar extends ConsumerWidget {
  const ScheduleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facility = ref.watch(scheduleFacilityControllerProvider);
    final areas = facility.areas;

    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      titleSpacing: 0,
      toolbarHeight: kToolbarHeight + 92,
      bottom: TabBar(tabs: [for (final area in areas) Tab(text: area.key.key)]),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_ScheduleLocation(), ScheduleDayPicker()],
      ),
    );
  }
}

class _ScheduleLocation extends ConsumerWidget {
  const _ScheduleLocation();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final facility = ref.watch(scheduleFacilityControllerProvider);

    return Row(
      children: [
        if (user.isBlackCard)
          IconButton(
            onPressed: () async {
              final newFacility = await ScheduleFacilityDialog.show(context);
              if (newFacility == null) return;
              ref
                  .read(scheduleFacilityControllerProvider.notifier)
                  .onFacilityChanged(newFacility);
            },
            icon: const Icon(Icons.place_outlined),
          )
        else
          const SizedBox(width: 16),
        Text(facility.key.key),
        const Spacer(),
        IconButton(
          onPressed: () async {
            await QRDialog.show(context, id: user.id);
            if (context.mounted) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(context.l10n.qrDialogShakeSnackbar),
                  ),
                );
            }
          },
          icon: const Icon(Icons.qr_code_rounded),
        )
      ],
    );
  }
}