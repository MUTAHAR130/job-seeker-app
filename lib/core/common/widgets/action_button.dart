import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  final bool? invertedColor;
  final bool? noBorder;
  final double? bheight;
  final double? bwidth;

  const ActionButton({
    super.key,
    required this.buttonText,
    required this.onPress,
    this.invertedColor,
    this.noBorder,
    this.bheight,
    this.bwidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPress();
      },
      style: ButtonStyle(
        shadowColor: WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(
              color: noBorder == true
                  ? Colors.transparent
                  : Get.theme.colorScheme.tertiary,
              width: 2,
            ),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          invertedColor == true
              ? Get.theme.colorScheme.surface
              : Get.theme.colorScheme.primary,
        ),
      ),
      child: SizedBox(
        height: bheight ?? 48,
        width: bwidth ?? double.infinity,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: invertedColor == true
                  ? Get.theme.colorScheme.tertiary
                  : Get.theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
