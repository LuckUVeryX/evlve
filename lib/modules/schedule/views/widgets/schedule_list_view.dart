import 'package:evlve/app/theme/theme_extensions.dart';
import 'package:evlve/app/views/shimmer_widget.dart';
import 'package:evlve/modules/booking/booking.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/modules/schedule_filter/controllers/schedule_filter_controller.dart';
import 'package:evlve/modules/schedule_filter/schedule_filter.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ScheduleListView extends ConsumerWidget {
  const ScheduleListView({
    required this.area,
    super.key,
  });

  final Area area;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = scheduleProvider(
      area: area,
      date: ref.watch(scheduleDateControllerProvider),
    );
    ref.listenErrors([provider]);

    final scheduleValue = ref.watch(provider);
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return scheduleValue.when(
          data: (scheduleList) {
            final filter = ref.watch(scheduleFilterControllerProvider);
            final schedules = [...scheduleList.schedules]..removeWhere((s) {
                if (filter == const ScheduleFilter()) return false;
                return !filter.levelFilters
                    .contains(s.event.classDetails.level);
              });
            if (index >= schedules.length) return null;
            final schedule = scheduleList.schedules[index];

            final bookingProvider =
                bookingControllerProvider(schedule: schedule);
            final booking = ref.watch(bookingProvider);

            final details = booking.value?.schedule.event.classDetails ??
                schedule.event.classDetails;

            final canBook = details.canBook && !booking.isLoading;
            final value = details.isCP ? null : details.isBookedByMe;

            return Consumer(
              builder: (context, ref, child) {
                ref
                  ..listenErrors([bookingProvider])
                  ..listen(
                    bookingProvider,
                    (prev, next) {
                      if (next.hasError) return;
                      final msg = next.value?.message;
                      if (msg == null) return;
                      if (prev?.value?.message == msg) return;
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text(msg)));
                    },
                  );
                return CheckboxListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  tristate: true,
                  value: value,
                  onChanged: !canBook
                      ? null
                      : (_) async {
                          if (schedule.isLateBooking) {
                            final confirm =
                                await LateBookingConfirmDialog.show(context);
                            if (confirm != true) return;
                          }

                          final notifier = ref.read(bookingProvider.notifier);
                          details.isBookedByMe
                              ? await notifier.cancel()
                              : await notifier.book();
                        },
                  title: Text(
                    schedule.title,
                  ),
                  subtitle: Text(
                    '''
${DateFormat.Hm().format(schedule.start)}|${schedule.end.difference(schedule.start).inMinutes}m''',
                  ),
                );
              },
            );
          },
          loading: () => const _ScheduleLoadingShimmer(),
          error: (e, st) {
            if (index != 0) return null;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
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
                    label: const Text('Retry'),
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
        );
      },
    );
  }
}

class _ScheduleLoadingShimmer extends StatelessWidget {
  const _ScheduleLoadingShimmer();

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: CheckboxListTile(
        value: false,
        onChanged: null,
        dense: true,
        visualDensity: VisualDensity.compact,
        title: Row(
          children: [
            Expanded(
              child: Container(color: Colors.white, height: 13),
            ),
            const Spacer(flex: 2),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Container(color: Colors.white, height: 12),
            ),
            const Spacer(flex: 3)
          ],
        ),
      ),
    );
  }
}
