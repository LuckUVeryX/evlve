import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/booking/booking.dart';
import 'package:evlve/modules/facility/facility.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/theme/utils/utils.dart';
import 'package:evlve/utils/date_utils.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleInfiniteList extends ConsumerStatefulWidget {
  const ScheduleInfiniteList({
    super.key,
  });

  @override
  ConsumerState<ScheduleInfiniteList> createState() =>
      _ScheduleInfiniteListState();
}

class _ScheduleInfiniteListState extends ConsumerState<ScheduleInfiniteList> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final forwardListKey = UniqueKey();
    final areas = ref.watch(facilityContollerProvider).areas;

    ref.listen(
      resetDateControllerProvider,
      (_, __) => _controller.animateTo(
        0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      ),
    );

    return Scrollable(
      controller: _controller,
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

class _ReverseList extends StatelessWidget {
  const _ReverseList({
    required this.area,
  });

  final Area area;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final page = index ~/ _pageSize + 1;
          final indexInPage = index % _pageSize;
          final date =
              DateTime.now().subtract(Duration(days: page)).stripTime();

          final provider = scheduleProvider(date: date, area: area);

          return Consumer(
            builder: (context, ref, child) {
              final scheduleValue = ref.watch(provider);
              ref.listenErrors([provider]);
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
                  if (indexInPage != 0) return const Offstage();
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
                          label: Text(
                            context.l10n.scheduleListViewErrorRetryButton,
                          ),
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
            },
          );
        },
      ),
    );
  }
}

class _ForwardList extends StatelessWidget {
  const _ForwardList({
    required this.area,
    super.key,
  });

  final Area area;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final page = index ~/ _pageSize;
          final indexInPage = index % _pageSize;
          final date = DateTime.now().add(Duration(days: page)).stripTime();

          final provider = scheduleProvider(date: date, area: area);

          return Consumer(
            builder: (context, ref, child) {
              ref.listenErrors([provider]);
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
                error: (e, st) {
                  if (indexInPage != 0) return const Offstage();
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
                          label: Text(
                            context.l10n.scheduleListViewErrorRetryButton,
                          ),
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
            },
          );
        },
      ),
    );
  }
}
