import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  final bool? invertedColor;
  final bool? noBorder;
  final bool? noColor;
  final double? bheight;
  final double? bwidth;
  final String? prefixIcon;
  final double? hPadding;

  const ActionButton({
    super.key,
    required this.buttonText,
    required this.onPress,
    this.invertedColor,
    this.noBorder,
    this.bheight,
    this.bwidth,
    this.prefixIcon,
    this.hPadding,
    this.noColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPress();
      },
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: hPadding ?? 8),
        ),
        shadowColor: WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(
              color: noBorder == true
                  ? Colors.transparent
                  : Get.theme.colorScheme.tertiary,
              width: 1,
            ),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          invertedColor == true
              ? Get.theme.colorScheme.surface
              : noColor == true
              ? Colors.transparent
              : Get.theme.colorScheme.primary,
        ),
      ),
      child: SizedBox(
        height: bheight ?? 48,
        width: bwidth ?? double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              prefixIcon != null ? SvgPicture.string(prefixIcon!) : SizedBox(),
              SizedBox(width: prefixIcon != null ? 5 : 0),
              Text(
                buttonText,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: invertedColor == true
                      ? Get.theme.colorScheme.tertiary
                      : Get.theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
