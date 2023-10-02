import 'package:evlve/app/app.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';

class AttendanceStats extends StatelessWidget {
  const AttendanceStats({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: context.textTheme.headlineSmall,
        ),
      ),
    );
  }
}

class AttendanceStatsShimmer extends StatelessWidget {
  const AttendanceStatsShimmer({
    this.flex = 1,
    super.key,
  });

  final int flex;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      sliver: SliverToBoxAdapter(
        child: ShimmerWidget(
          child: Row(
            children: [
              Expanded(
                flex: flex,
                child: Container(
                  color: Colors.black,
                  height: context.textTheme.headlineSmall?.fontSize,
                  width: double.infinity,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
