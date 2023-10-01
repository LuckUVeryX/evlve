import 'package:flutter/material.dart';

class NeuContainer extends StatelessWidget {
  const NeuContainer({
    this.child,
    this.color,
    this.margin,
    this.padding,
    this.height,
    this.width,
    super.key,
  });

  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 4),
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, 4),
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
