import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:evlve/app/views/views.dart';
import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDialog extends ConsumerWidget {
  const QRDialog._();

  static Future<void> show(WidgetRef ref) async {
    unawaited(HapticFeedback.mediumImpact());
    await ref.read(
      raiseBrightnessProvider(
        () async => showDialog(
          context: ref.context,
          builder: (_) => const QRDialog._(),
        ),
      ).future,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Dialog(
      child: NeuContainer(
        child: QRCode(),
      ),
    );
  }
}

class QRCode extends ConsumerWidget {
  const QRCode({
    super.key,
    this.imageDimension = 40,
  });

  final double imageDimension;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(userProvider).id;
    return QrImageView(
      backgroundColor: context.colorScheme.background,
      data: id,
      eyeStyle: QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: context.colorScheme.onBackground,
      ),
      dataModuleStyle: QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.square,
        color: context.colorScheme.onBackground,
      ),
      embeddedImage: const CachedNetworkImageProvider(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs_VVgajqAz15gS4Pt8drb59szsee8MZTjtcpQU9Woh9gRpMf7',
      ),
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: Size.square(imageDimension),
      ),
    );
  }
}
