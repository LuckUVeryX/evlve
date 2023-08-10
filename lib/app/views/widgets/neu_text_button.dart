import 'package:evlve/app/views/widgets/neu_button.dart';
import 'package:evlve/utils/theme_extensions.dart';
import 'package:flutter/material.dart';

class NeuTextButton extends StatelessWidget {
  const NeuTextButton({
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    this.label,
    super.key,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;

  final String? label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return NeuButton(
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: label != null
              ? Text(
                  label!,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: foregroundColor ?? context.colorScheme.onPrimary,
                  ),
                )
              : SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(
                    color: foregroundColor ?? context.colorScheme.onPrimary,
                  ),
                ),
        ),
      ),
    );
  }
}
