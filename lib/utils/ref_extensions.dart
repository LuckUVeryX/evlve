import 'dart:async';

import 'package:dio/dio.dart';
import 'package:evlve/modules/auth/auth.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefX on WidgetRef {
  void listenErrors(List<ProviderListenable<AsyncValue<dynamic>>> providers) {
    for (final provider in providers) {
      listen(
        provider,
        (prev, next) {
          next.whenOrNull(
            error: (e, st) {
              // Prevent duplicate errors
              if (prev?.error == e) return;
              _onError(e, st);
            },
          );
        },
        onError: _onError,
      );
    }
  }

  /// Parses different errors `e` to readable error snackbars.
  void _onError(Object e, StackTrace st) {
    String? errorMessage;

    if (e is DioException) errorMessage = _parseDioExceptionMessage(e);

    _showErrorSnackbar(errorMessage ?? e.toString());
  }

  String? _parseDioExceptionMessage(DioException e) {
    final responseData = e.response?.data;
    if (responseData is Map<String, dynamic>?) {
      final responseMessage = responseData?['message'];
      if (responseMessage is String) return responseMessage;
    }

    return e.message;
  }

  void _showErrorSnackbar(String errorMessage) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: context.colorScheme.onError),
          ),
          backgroundColor: context.colorScheme.error,
        ),
      );
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

    /// Invalidate all caches when user is logged out
    listen(authControllerProvider, (_, auth) {
      auth.whenData(
        (value) => value.maybeMap(orElse: link.close, loggedIn: (_) {}),
      );
    });
  }
}
