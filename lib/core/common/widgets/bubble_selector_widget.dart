import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BubbleSelectorWidget extends StatelessWidget {
  final String text;
  final bool selected;

  const BubbleSelectorWidget({
    super.key,
    required this.text,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: selected ? Get.theme.colorScheme.surface : Colors.transparent,
        border: BoxBorder.all(
          color: Get.theme.colorScheme.tertiary
        )
      ),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
    );
  }
}
