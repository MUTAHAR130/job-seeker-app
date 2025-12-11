import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionToggleTile extends StatelessWidget {
  final String tileText;
  final bool toggleValue;
  final bool? subTile;
  final bool? hasSubTiles;
  final Function toggleFunction;

  const OptionToggleTile(
      {super.key,
        required this.toggleValue,
        required this.toggleFunction,
        required this.tileText,
        this.subTile,
        this.hasSubTiles});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      dense: true,
      title: Text(
        tileText,
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Switch(
        value: toggleValue,
        onChanged: (value) {
          toggleFunction(value);
        },
        activeColor: Get.theme.colorScheme.secondary,
        inactiveThumbColor: Get.theme.colorScheme.surface,
        inactiveTrackColor: Get.theme.colorScheme.outline,
      ),
    );
  }
}