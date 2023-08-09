import 'package:evlve/app/views/views.dart';
import 'package:evlve/modules/booking/booking.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/utils/ref_extensions.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ScheduleListItem extends ConsumerWidget {
  const ScheduleListItem({
    required this.schedule,
    super.key,
  });

  final Schedule schedule;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingProvider = bookingControllerProvider(schedule: schedule);
    final booking = ref.watch(bookingProvider);

    ref
      ..listenErrors([bookingProvider])
      ..listen(bookingProvider, (prev, next) {
        HapticFeedback.mediumImpact();
        if (next.hasError) return;
        final msg = next.value?.message;
        if (msg == null) return;
        if (prev?.value?.message == msg) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(msg)));
      });

    final details = booking.value?.schedule.event.classDetails ??
        schedule.event.classDetails;

    final canBook = details.canBook && !booking.isLoading;
    final value = details.isCP ? null : details.isBookedByMe;

    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: schedule.event.classDetails.level.color,
          brightness: context.theme.brightness,
        ),
        useMaterial3: true,
        textTheme: context.textTheme,
      ),
      child: Builder(
        builder: (context) {
          return NeuButton(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            onPressed: canBook ? () {} : null,
            color: context.colorScheme.primary,
            child: CheckboxListTile(
              value: value,
              tristate: true,
              onChanged: (!canBook)
                  ? null
                  : (_) async {
                      final notifier = ref.read(bookingProvider.notifier);

                      if (schedule.isLateBooking) {
                        final confirm =
                            await LateBookingConfirmDialog.show(context);
                        if (confirm != true) return;
                      }

                      details.isBookedByMe
                          ? await notifier.cancel()
                          : await notifier.book();
                    },
              title: Text(
                schedule.event.classDetails.level.key,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: canBook
                      ? context.colorScheme.onPrimary
                      : context.theme.disabledColor,
                ),
              ),
              subtitle: Text(
                '''
            ${DateFormat.Hm().format(schedule.start)}|${schedule.end.difference(schedule.start).inMinutes}m''',
                style: context.textTheme.labelLarge?.copyWith(
                  color: canBook
                      ? context.colorScheme.onPrimary
                      : context.theme.disabledColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScheduleListItemShimmer extends StatelessWidget {
  const ScheduleListItemShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: NeuButton(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: CheckboxListTile(
          value: false,
          onChanged: null,
          title: SizedBox(
            height: context.textTheme.bodyLarge?.fontSize,
          ),
          subtitle: SizedBox(
            height: context.textTheme.bodyMedium?.fontSize,
          ),
        ),
      ),
    );
  }
}
