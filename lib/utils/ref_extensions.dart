import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefX on WidgetRef {
  void listenErrors(
    BuildContext context,
    List<ProviderListenable<AsyncValue<dynamic>>> providers,
  ) {
    for (final provider in providers) {
      listen(
        provider,
        (_, value) => value.whenOrNull(error: _showErrorSnackbar),
        onError: _showErrorSnackbar,
      );
    }
  }

  void _showErrorSnackbar(Object e, StackTrace st) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
