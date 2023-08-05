import 'package:evlve/app/views/shimmer_widget.dart';
import 'package:evlve/modules/booking/booking.dart';
import 'package:evlve/modules/schedule/schedule.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
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

    final details = booking.value?.schedule.event.classDetails ??
        schedule.event.classDetails;

    final canBook = details.canBook && !booking.isLoading;
    final value = details.isCP ? null : details.isBookedByMe;

    return CheckboxListTile(
      tristate: true,
      value: value,
      onChanged: !canBook
          ? null
          : (_) async {
              final notifier = ref.read(bookingProvider.notifier);

              if (schedule.isLateBooking) {
                final confirm = await LateBookingConfirmDialog.show(context);
                if (confirm != true) return;
              }

              details.isBookedByMe
                  ? await notifier.cancel()
                  : await notifier.book();
            },
      title: Text(
        schedule.event.classDetails.level.key,
      ),
      subtitle: Text(
        '''
${DateFormat.Hm().format(schedule.start)}|${schedule.end.difference(schedule.start).inMinutes}m''',
      ),
    );
  }
}

class ScheduleListItemShimmer extends StatelessWidget {
  const ScheduleListItemShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: CheckboxListTile(
        value: false,
        onChanged: null,
        title: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                height: context.textTheme.bodyLarge?.fontSize,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                height: context.textTheme.bodyMedium?.fontSize,
              ),
            ),
            const Spacer(flex: 3)
          ],
        ),
      ),
    );
  }
}
