import 'package:evlve/modules/tester/controllers/tester_detector_controller.dart';
import 'package:evlve/modules/tester/tester.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TesterDetector extends ConsumerWidget {
  const TesterDetector({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(testerDetectorControllerProvider, (_, count) {
      if (count != TesterDetectorController.tapCount) return;
      ref.watch(testerControllerProvider.notifier).overrideTester();
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Disabled Tester Mode')),
        );
    });
    return GestureDetector(
      onTap: ref.read(testerDetectorControllerProvider.notifier).incrementCount,
      child: child,
    );
  }
}
