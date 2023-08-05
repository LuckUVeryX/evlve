import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ScheduleFacilityDialog extends ConsumerWidget {
  const ScheduleFacilityDialog._();

  static Future<FacilityExtraData?> show(BuildContext context) {
    return showDialog<FacilityExtraData>(
      context: context,
      builder: (context) => const ScheduleFacilityDialog._(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final facilities = user.facilities;

    return SimpleDialog(
      backgroundColor: context.colorScheme.surface,
      clipBehavior: Clip.antiAlias,
      title: Text(context.l10n.facilityDialogTitle),
      children: [
        for (final facility in facilities)
          SimpleDialogOption(
            onPressed: () => context.pop(facility),
            child: Text(facility.key.key),
          )
      ],
    );
  }
}
