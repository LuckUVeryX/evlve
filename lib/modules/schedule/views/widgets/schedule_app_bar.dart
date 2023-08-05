import 'package:evlve/app/router/router.routes.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/theme/theme.dart';
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
      pinned: true,
      titleSpacing: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      title: GestureDetector(
        onTap: ref.read(resetDateControllerProvider.notifier).resetDate,
        child: Text(facility.key.key),
      ),
      leading: const _LocationIconButton(),
      actions: const [_SettingsIconButton()],
      bottom: const _ScheduleAppBarBottom(),
    );
  }
}

class _SettingsIconButton extends StatelessWidget {
  const _SettingsIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.go(p.join(Routes.schedule, Routes.settings));
      },
      icon: const Icon(Icons.settings_outlined),
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
                  .read(facilityContollerProvider.notifier)
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
    final facility = ref.watch(facilityContollerProvider);
    final areas = facility.areas;

    return TabBar(
      onTap: (_) {
        final indexIsChanging =
            DefaultTabController.of(context).indexIsChanging;
        if (indexIsChanging) return;
        ref.read(resetDateControllerProvider.notifier).resetDate();
      },
      tabs: [for (final area in areas) Tab(text: area.key.key)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
