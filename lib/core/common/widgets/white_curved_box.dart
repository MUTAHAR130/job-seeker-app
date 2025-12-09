import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhiteCurvedBox extends StatelessWidget {
  final Widget child;
  final double? radius;
  final double? margin;

  const WhiteCurvedBox({super.key, required this.child, this.radius, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 24),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
        color: Get.theme.colorScheme.surface,
      ),
      child: child,
    );
  }
}
