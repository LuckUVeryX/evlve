import 'package:evlve/app/app.dart';
import 'package:evlve/app/router/router.routes.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;

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
      foregroundColor: context.colorScheme.onBackground,
    );
  }
}

class _SettingsIconButton extends StatelessWidget {
  const _SettingsIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.go(p.join(Routes.schedule, Routes.settings)),
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
      child: NeuButton(
        color: context.colorScheme.background,
        onPressed: () async {
          final newFacility = await FacilityDialog.show(context);
          if (newFacility == null) return;
          ref
              .read(facilityContollerProvider.notifier)
              .onFacilityChanged(newFacility);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            Icons.place_outlined,
            color: context.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
