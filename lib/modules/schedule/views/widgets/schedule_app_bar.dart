import 'package:evlve/app/app.dart';
import 'package:evlve/app/router/routes.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScheduleAppBar extends ConsumerWidget {
  const ScheduleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facility = ref.watch(facilityContollerProvider);
    return SliverAppBar(
      snap: true,
      pinned: true,
      floating: true,
      title: Text(facility.title.toUpperCase()),
      bottom: const ScheduleTabBar(),
      leading: const _LocationIconButton(),
      actions: const [_SettingsIconButton()],
      backgroundColor: context.colorScheme.surface,
      foregroundColor: context.colorScheme.onSurface,
      actionsIconTheme: context.theme.iconTheme,
    );
  }
}

class _SettingsIconButton extends StatelessWidget {
  const _SettingsIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => const SettingsRoute().go(context),
      icon: const Icon(Icons.settings_outlined),
    );
  }
}

class _LocationIconButton extends ConsumerWidget {
  const _LocationIconButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    if (!user.isBlackCard) return const Offstage();

    return Center(
      child: NeuIconButton(
        foregroundColor: context.colorScheme.onSurface,
        backgroundColor: context.colorScheme.surface,
        onPressed: () async {
          final newFacility = await FacilityDialog.show(context);
          if (newFacility == null) return;
          ref
              .read(facilityContollerProvider.notifier)
              .onFacilityChanged(newFacility);
        },
        icon: Icons.place_outlined,
      ),
    );
  }
}
