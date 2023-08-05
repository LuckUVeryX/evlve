import 'dart:convert';
import 'dart:developer' as developer;

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger_provider.g.dart';

@riverpod
Logger log(LogRef ref) {
  throw UnimplementedError();
}

/// Outputs simple log messages:
/// ```
/// [E] Log message  ERROR: Error info
/// ```
///
/// The difference between this [AppPrinter] & [SimplePrinter] is that it prints
/// the entire line in the coresponding levelColor.
class AppPrinter extends LogPrinter {
  AppPrinter();

  @override
  List<String> log(LogEvent event) {
    final messageStr = _stringifyMessage(event.message);
    final errorStr = event.error != null ? '  ERROR: ${event.error}' : '';
    final timeStr = 'TIME: ${event.time.toIso8601String()}';

    final prefix = SimplePrinter.levelPrefixes[event.level]!;
    final color = SimplePrinter.levelColors[event.level]!;

    return [color('$prefix $timeStr $messageStr$errorStr')];
  }
}

String _stringifyMessage(dynamic message) {
  // ignore: avoid_dynamic_calls
  final finalMessage = message is Function ? message.call() : message;
  if (finalMessage is Map || finalMessage is Iterable) {
    const encoder = JsonEncoder.withIndent(null);
    return encoder.convert(finalMessage);
  } else {
    return finalMessage.toString();
  }
}

class ConsoleLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(developer.log);
  }
}
