import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImprovementTile extends StatelessWidget {
  final int count;
  final String text;

  const ImprovementTile({super.key, required this.count, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Get.theme.colorScheme.surface,
        ),
        child: Center(child: Text('$count', style: TextStyle(fontSize: 16))),
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}