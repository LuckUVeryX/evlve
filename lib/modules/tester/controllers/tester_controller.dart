import 'package:evlve/modules/tester/tester.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tester_controller.g.dart';

@riverpod
class TesterController extends _$TesterController {
  @override
  bool build() {
    final repo = ref.watch(testerRepoProvider);
    final isUserTester =
        ref.watch(userProvider.select((user) => user.isTester));

    return isUserTester && !repo.overrideTester;
  }

  void overrideTester() {
    if (!state) return;
    final repo = ref.read(testerRepoProvider);
    state = false;
    repo.saveOverrideTesterPref();
  }
}
