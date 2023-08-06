import 'package:evlve/app/app.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FacilityDialog extends ConsumerWidget {
  const FacilityDialog._();

  static Future<FacilityExtraData?> show(BuildContext context) {
    return showDialog<FacilityExtraData>(
      context: context,
      builder: (context) => const FacilityDialog._(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final facilities = user.facilities;

    return Dialog(
      child: NeuContainer(
        color: context.colorScheme.surfaceVariant,
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox.square(dimension: 12),
              Text(
                context.l10n.facilityDialogTitle,
                style: context.textTheme.titleLarge,
              ),
              for (final facility in facilities)
                ListTile(
                  onTap: () => context.pop(facility),
                  title: Text(facility.key.key),
                )
            ],
          ),
        ),
      ),
    );
  }
}
