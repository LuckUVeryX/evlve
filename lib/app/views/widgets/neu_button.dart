import 'package:evlve/theme/theme.dart';
import 'package:flutter/material.dart';

class NeuButton extends StatefulWidget {
  const NeuButton({
    this.color,
    this.onPressed,
    this.child,
    super.key,
  });

  final Color? color;

  final VoidCallback? onPressed;
  final Widget? child;

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.identity()
        ..translate(
          _pressed ? 4.0 : 0.0,
          _pressed ? 4.0 : 0.0,
        ),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        border: Border.all(width: 4),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(offset: _pressed ? Offset.zero : const Offset(4, 4))
        ],
      ),
      child: Material(
        color: widget.color ?? context.colorScheme.primary,
        child: InkWell(
          onTap: widget.onPressed,
          onTapDown: (details) {
            if (widget.onPressed == null) return;
            setState(() => _pressed = true);
          },
          onTapCancel: () {
            if (widget.onPressed == null) return;
            setState(() => _pressed = false);
          },
          onTapUp: (details) {
            if (widget.onPressed == null) return;
            setState(() => _pressed = false);
          },
          child: widget.child,
        ),
      ),
    );
  }
}
