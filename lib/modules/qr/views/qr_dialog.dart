import 'package:cached_network_image/cached_network_image.dart';
import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDialog extends StatelessWidget {
  const QRDialog._({required this.id});

  static Future<void> show(BuildContext context, {required String id}) {
    return showDialog(context: context, builder: (_) => QRDialog._(id: id));
  }

  final String id;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: QrImageView(
        data: id,
        eyeStyle: QrEyeStyle(
          eyeShape: QrEyeShape.circle,
          color: context.colorScheme.onSurface,
        ),
        dataModuleStyle: QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.circle,
          color: context.colorScheme.onSurface,
        ),
        embeddedImage: const CachedNetworkImageProvider(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs_VVgajqAz15gS4Pt8drb59szsee8MZTjtcpQU9Woh9gRpMf7',
        ),
        embeddedImageStyle: const QrEmbeddedImageStyle(
          size: Size.square(40),
        ),
      ),
    );
  }
}
