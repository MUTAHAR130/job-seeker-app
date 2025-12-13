import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhiteCurvedBox extends StatelessWidget {
  final Widget child;
  final double? radius;
  final double? margin;
  final Color? color;
  final Color? borderColor;

  const WhiteCurvedBox({
    super.key,
    required this.child,
    this.radius,
    this.margin,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
        color: color ?? Get.theme.colorScheme.surface,
        border: BoxBorder.all(color: borderColor ?? Colors.transparent),
      ),
      child: child,
    );
  }
}
