import 'package:evlve/app/app.dart';
import 'package:evlve/modules/booking/booking.dart';
import 'package:evlve/modules/schedule/schedule.dart';
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
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(provider.future),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return scheduleValue.when(
            data: (scheduleList) {
              final schedules = scheduleList.schedules;
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
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: context.colorScheme.onSurface),
                    ),
                    subtitle: Text(
                      DateFormat.Hms().format(schedule.start),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  );
                },
              );
            },
            error: (e, st) {
              return index == 0 ? Text(e.toString()) : null;
            },
            loading: () {
              return index == 0
                  ? const Center(child: CircularProgressIndicator())
                  : null;
            },
          );
        },
      ),
    );
  }
}
