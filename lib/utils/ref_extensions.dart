import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefX on WidgetRef {
  void listenErrors(List<ProviderListenable<AsyncValue<dynamic>>> providers) {
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

extension AutoDisposeRefX<T> on AutoDisposeRef<T> {
  void cache({
    Duration duration = const Duration(seconds: 30),
    CancelToken? cancelToken,
  }) {
    final link = keepAlive();
    Timer? timer;
    onCancel(() => timer = Timer(duration, link.close));
    onResume(() => timer?.cancel());
    onDispose(() {
      timer?.cancel();
      cancelToken?.cancel();
    });
  }
}
