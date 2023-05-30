import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/schedule_filter/controllers/schedule_filter_controller.dart';
import 'package:evlve/modules/schedule_filter/schedule_filter.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleAppBar extends ConsumerWidget {
  const ScheduleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facility = ref.watch(scheduleFacilityControllerProvider);

    return SliverAppBar(
      pinned: true,
      floating: true,
      titleSpacing: 0,
      bottom: const _AppBarBottom(),
      leading: const _LocationIconButton(),
      title: Text(facility.key.key),
      centerTitle: false,
      actions: const [
        _FilterIconButton(),
        _QRIconButton(),
      ],
    );
  }
}

class _AppBarBottom extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBarBottom();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facility = ref.watch(scheduleFacilityControllerProvider);
    final areas = facility.areas;
    return Column(
      children: [
        const ScheduleDayPicker(),
        TabBar(tabs: [for (final area in areas) Tab(text: area.key.key)]),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(92 + kToolbarHeight);
}

class _FilterIconButton extends ConsumerWidget {
  const _FilterIconButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(scheduleFilterControllerProvider);
    final isFiltered = filter != const ScheduleFilter();
    return IconButton(
      onPressed: () async {
        final filter = await ScheduleFilterDialog.show(context);
        if (filter == null) return;
        ref.read(scheduleFilterControllerProvider.notifier).filter(filter);
      },
      icon: Badge(
        backgroundColor: isFiltered ? null : Colors.transparent,
        child: const Icon(Icons.tune),
      ),
    );
  }
}

class _QRIconButton extends ConsumerWidget {
  const _QRIconButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return IconButton(
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
    );
  }
}

class _LocationIconButton extends ConsumerWidget {
  const _LocationIconButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return IconButton(
      onPressed: !user.isBlackCard
          ? null
          : () async {
              final newFacility = await ScheduleFacilityDialog.show(context);
              if (newFacility == null) return;
              ref
                  .read(scheduleFacilityControllerProvider.notifier)
                  .onFacilityChanged(newFacility);
            },
      icon: Icon(
        Icons.place_outlined,
        color: context.colorScheme.onBackground,
      ),
    );
  }
}
