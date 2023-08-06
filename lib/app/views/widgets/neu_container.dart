import 'package:flutter/material.dart';

class NeuContainer extends StatelessWidget {
  const NeuContainer({
    required this.child,
    this.color,
    this.margin,
    this.padding,
    super.key,
  });

  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 4),
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [BoxShadow(offset: Offset(4, 4))],
      ),
      child: child,
    );
  }
}
