import 'package:evlve/app/views/widgets/neu_button.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';

class NeuIconButton extends StatelessWidget {
  const NeuIconButton({
    required this.icon,
    this.iconSize,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    super.key,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;

  final IconData icon;
  final double? iconSize;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return NeuButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: iconSize,
          color: foregroundColor ?? context.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
