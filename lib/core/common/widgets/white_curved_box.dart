import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhiteCurvedBox extends StatelessWidget {
  final Widget child;
  final double? radius;

  const WhiteCurvedBox({super.key, required this.child, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
        color: Get.theme.colorScheme.surface,
      ),
      child: child,
    );
  }
}
