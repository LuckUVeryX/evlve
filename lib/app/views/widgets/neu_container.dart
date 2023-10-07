import 'package:flutter/material.dart';

class NeuContainer extends StatelessWidget {
  const NeuContainer({
    this.child,
    this.color,
    this.border,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.shadow = true,
    super.key,
  });

  final Widget? child;
  final Color? color;
  final BoxBorder? border;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: border ?? Border.all(width: 4),
        borderRadius: BorderRadius.circular(4),
        boxShadow: shadow
            ? const [BoxShadow(offset: Offset(4, 4), spreadRadius: 1)]
            : null,
      ),
      child: child,
    );
  }
}
