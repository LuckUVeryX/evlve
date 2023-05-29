import 'package:evlve/app/theme/theme_extensions.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/schedule_filter/schedule_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ScheduleFilterDialog extends StatelessWidget {
  const ScheduleFilterDialog._();

  static Future<ScheduleFilter?> show(BuildContext context) {
    return showDialog<ScheduleFilter>(
      context: context,
      useSafeArea: false,
      builder: (context) => const ScheduleFilterDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.scheduleFilterDialogTitle),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: context.pop,
        ),
        actions: const [_ResetButton()],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // * MT
                _FilterHeader(
                  icon: Icons.sports_martial_arts,
                  label: context.l10n.scheduleFilterSectionMT,
                ),
                const Divider(),
                _FilterList(levels: Level.mt),
                const SizedBox(height: 16),
                // * Boxing
                _FilterHeader(
                  icon: Icons.sports_mma_outlined,
                  label: context.l10n.scheduleFilterSectionBoxing,
                ),
                const Divider(),
                _FilterList(levels: Level.boxing),
                const SizedBox(height: 16),
                // * BJJ
                _FilterHeader(
                  icon: Icons.sports_kabaddi_outlined,
                  label: context.l10n.scheduleFilterSectionBJJ,
                ),
                const Divider(),
                _FilterList(levels: Level.bjj),
                const SizedBox(height: 16),
                // * Others
                _FilterHeader(
                  icon: Icons.sports_kabaddi_outlined,
                  label: context.l10n.scheduleFilterSectionOthers,
                ),
                const Divider(),
                _FilterList(levels: Level.others),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: context.pop,
                      child: Text(context.l10n.scheduleFilterCancel),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: _ApplyFilterButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.pop,
      child: Text(context.l10n.scheduleFilterResetButton),
    );
  }
}

class _ApplyFilterButton extends ConsumerWidget {
  const _ApplyFilterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () {
        context.pop(
          ref.read(scheduleFilterDialogControllerProvider),
        );
      },
      child: Text(context.l10n.scheduleFilterApply),
    );
  }
}

class _FilterList extends StatelessWidget {
  const _FilterList({
    required this.levels,
  });

  final List<Level> levels;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: [
        for (final level in levels) _LevelFilterChip(level: level),
      ],
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Text(
          label,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _LevelFilterChip extends ConsumerWidget {
  const _LevelFilterChip({
    required this.level,
  });

  final Level level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(scheduleFilterDialogControllerProvider);

    return FilterChip(
      selected: filter.levelFilters.contains(level),
      label: Text(level.key),
      onSelected: (_) => ref
          .read(scheduleFilterDialogControllerProvider.notifier)
          .onLevelFilterSelected(level),
      visualDensity: VisualDensity.compact,
    );
  }
}
