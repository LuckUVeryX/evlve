import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/booking/booking.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/theme/utils/utils.dart';
import 'package:evlve/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleInfiniteList extends ConsumerWidget {
  const ScheduleInfiniteList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forwardListKey = UniqueKey();
    final areas = ref.watch(scheduleFacilityControllerProvider).areas;

    return Scrollable(
      viewportBuilder: (context, position) {
        return TabBarView(
          children: [
            for (final area in areas)
              Viewport(
                offset: position,
                center: forwardListKey,
                slivers: [
                  _ReverseList(area: area.key),
                  _ForwardList(area: area.key, key: forwardListKey)
                ],
              ),
          ],
        );
      },
    );
  }
}

const _pageSize = 48;

class _ReverseList extends ConsumerWidget {
  const _ReverseList({
    required this.area,
  });

  final Area area;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final page = index ~/ _pageSize + 1;
        final indexInPage = index % _pageSize;
        final date = DateTime.now().subtract(Duration(days: page)).stripTime();

        final provider = scheduleProvider(date: date, area: area);

        final scheduleValue = ref.watch(provider);
        return scheduleValue.when(
          data: (scheduleList) {
            final schedules = scheduleList.schedules.reversed.toList();
            if (indexInPage >= schedules.length) return const Offstage();

            final schedule = schedules[indexInPage];

            return Column(
              children: [
                if (indexInPage == schedules.length - 1)
                  ScheduleDateHeader(dt: date),
                ScheduleListItem(schedule: schedule),
              ],
            );
          },
          error: (e, st) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      ref
                        ..invalidate(provider)
                        ..invalidate(bookingControllerProvider);
                    },
                    icon: const Icon(Icons.refresh),
                    label: Text(context.l10n.scheduleListViewErrorRetryButton),
                  ),
                  Text(
                    e.toString(),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.error,
                    ),
                  ),
                ],
              ),
            );
          },
          loading: () => const ScheduleListItemShimmer(),
        );
      }),
    );
  }
}

class _ForwardList extends ConsumerWidget {
  const _ForwardList({
    required this.area,
    super.key,
  });

  final Area area;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final page = index ~/ _pageSize;
        final indexInPage = index % _pageSize;
        final date = DateTime.now().add(Duration(days: page)).stripTime();

        final provider = scheduleProvider(date: date, area: area);

        final scheduleValue = ref.watch(provider);
        return scheduleValue.when(
          data: (scheduleList) {
            final schedules = scheduleList.schedules;

            if (indexInPage >= schedules.length) return const Offstage();

            final schedule = schedules[indexInPage];
            return Column(
              children: [
                if (indexInPage == 0) ScheduleDateHeader(dt: date),
                ScheduleListItem(schedule: schedule),
              ],
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () => const ScheduleListItemShimmer(),
        );
      }),
    );
  }
}
