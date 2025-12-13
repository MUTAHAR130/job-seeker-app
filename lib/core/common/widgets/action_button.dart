import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  final bool? inverted;
  final bool? noBorder;
  final bool? noColor;
  final double? height;
  final double? width;
  final String? prefixIcon;
  final double? hPadding;
  final Color? bgColor;
  final bool? disabled;

  const ActionButton({
    super.key,
    required this.buttonText,
    required this.onPress,
    this.inverted,
    this.noBorder,
    this.height,
    this.width,
    this.prefixIcon,
    this.hPadding,
    this.noColor,
    this.bgColor,
    this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        disabled == true ? null : onPress();
      },
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: hPadding ?? 8, vertical: 0),
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
          bgColor ??
              (disabled == true
                  ? Get.theme.colorScheme.outline
                  : noColor == true
                  ? Colors.transparent
                  : inverted == true
                  ? Get.theme.colorScheme.surface
                  : Get.theme.colorScheme.primary),
        ),
      ),
      child: SizedBox(
        height: height ?? 48,
        width: width ?? double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              prefixIcon != null ? SvgPicture.string(prefixIcon!) : SizedBox(),
              SizedBox(
                width: buttonText == ''
                    ? 0
                    : prefixIcon != null
                    ? 5
                    : 0,
              ),
              buttonText != ''
                  ? Text(
                      buttonText,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: inverted == true
                            ? Get.theme.colorScheme.tertiary
                            : Get.theme.colorScheme.onPrimary,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
