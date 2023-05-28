import 'package:cached_network_image/cached_network_image.dart';
import 'package:evlve/app/app.dart';
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
        backgroundColor: Colors.black,
        eyeStyle: QrEyeStyle(
          eyeShape: QrEyeShape.circle,
          color: context.colorScheme.onBackground,
        ),
        dataModuleStyle: QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.circle,
          color: context.colorScheme.onBackground,
        ),
        embeddedImage: const CachedNetworkImageProvider(
          'https://yt3.googleusercontent.com/ytc/AGIKgqPmxDPeoyBRQEQzjURVgiSH8mA942AA_UL4ndx4=s900-c-k-c0x00ffffff-no-rj',
        ),
      ),
    );
  }
}
