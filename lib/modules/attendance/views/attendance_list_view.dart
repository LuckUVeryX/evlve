import 'package:dio/dio.dart';
import 'package:evlve/l10n/l10n.dart';
import 'package:evlve/modules/attendance/attendance.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceListView extends ConsumerStatefulWidget {
  const AttendanceListView({super.key});

  @override
  ConsumerState<AttendanceListView> createState() => _AttendanceListViewState();
}

class _AttendanceListViewState extends ConsumerState<AttendanceListView> {
  late final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    const pageSize = 100;

    ref.listen(
      attendanceScrollControllerProvider,
      (_, __) => _controller.animateTo(
        0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      ),
    );

    return NestedScrollView(
      controller: _controller,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [SliverAppBar.large(title: Text(context.l10n.attendance))];
      },
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(attendanceProvider);
          return ref.read(
            attendanceProvider(page: 0, limit: pageSize).future,
          );
        },
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final page = index ~/ pageSize;
            final indexInPage = index % pageSize;

            final provider = attendanceProvider(limit: pageSize, page: page);
            final attendanceList = ref.watch(provider);

            return attendanceList.unwrapPrevious().when(
                  loading: () => const AttendanceListItemShimmer(),
                  error: (e, st) {
                    if (indexInPage != 0) return null;
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
                              ref.invalidate(provider);
                            },
                            icon: const Icon(Icons.refresh),
                            label: Text(
                              context.l10n.scheduleListViewErrorRetryButton,
                            ),
                          ),
                          Text(
                            (e is DioException)
                                ? e.message ?? e.toString()
                                : e.toString(),
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  data: (attendances) {
                    if (indexInPage >= attendances.length) return null;
                    final attendance = attendances[indexInPage];

                    final showDateHeader = indexInPage == 0 ||
                        attendance.date != attendances[indexInPage - 1].date;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showDateHeader)
                          AttendanceDateHeader(date: attendance.date),
                        AttendanceListItem(
                          index: index + 1,
                          attendance: attendance,
                        ),
                      ],
                    );
                  },
                );
          },
        ),
      ),
    );
  }
}
