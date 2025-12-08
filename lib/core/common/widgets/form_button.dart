import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  final bool? invertedColor;

  const FormButton({
    super.key,
    required this.buttonText,
    required this.onPress,
    this.invertedColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPress();
      },
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(
              color: Get.theme.colorScheme.tertiary,
              width: 2,
            ),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll( invertedColor == true ? Get.theme.colorScheme.surface : Get.theme.colorScheme.primary),
      ),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: invertedColor == true ? Get.theme.colorScheme.tertiary : Get.theme.colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
