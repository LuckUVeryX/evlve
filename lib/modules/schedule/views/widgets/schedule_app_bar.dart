import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/schedule/schedule.dart';
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
      centerTitle: false,
      title: Text(facility.key.key),
      leading: const _LocationIconButton(),
      actions: const [_QRIconButton()],
      bottom: const _ScheduleAppBarBottom(),
    );
  }
}

class _QRIconButton extends ConsumerWidget {
  const _QRIconButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        ref.read(setMaxBrightnessProvider);
        await QRDialog.show(context);
        ref.read(resetBrightnessProvider);
        if (context.mounted) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(context.l10n.qrDialogShakeSnackbar)),
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

class _ScheduleAppBarBottom extends ConsumerWidget
    implements PreferredSizeWidget {
  const _ScheduleAppBarBottom();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facility = ref.watch(scheduleFacilityControllerProvider);
    final areas = facility.areas;

    return TabBar(
      tabs: [for (final area in areas) Tab(text: area.key.key)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
