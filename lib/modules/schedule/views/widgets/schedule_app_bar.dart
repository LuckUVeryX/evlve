import 'package:evlve/app/app.dart';
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
    return const SliverAppBar(
      leading: _LocationIconButton(),
      actions: [_SettingsIconButton()],
    );
  }
}

class _SettingsIconButton extends StatelessWidget {
  const _SettingsIconButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: NeuButton(
        color: context.colorScheme.primary,
        onPressed: () => context.go(p.join(Routes.schedule, Routes.settings)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            Icons.settings_outlined,
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
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
          final newFacility = await ScheduleFacilityDialog.show(context);
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
