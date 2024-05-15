import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';

class EvolveLogo extends StatelessWidget {
  const EvolveLogo({
    super.key,
    this.color,
    this.dimension,
  });

  final Color? color;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension ?? 24,
      child: CustomPaint(
        painter: _EvolveLogoPainter(
          color: color ?? context.colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _EvolveLogoPainter extends CustomPainter {
  _EvolveLogoPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final (x, y) = (size.width, size.height);

    canvas.drawPath(
      Path()
        ..moveTo(0, y / 2) // Left diamond point
        ..lineTo(x / 2, y * 0.35) // Top diamond point
        ..lineTo(x, y / 2) // Right diamond point
        ..lineTo(x / 2, y * 0.65), // Bottom diamond point
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _EvolveLogoPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
