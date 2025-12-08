import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? hidden;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function? hiddenToggle;
  static final customBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Get.theme.colorScheme.outline),
    borderRadius: const BorderRadius.all(Radius.circular(4)),
  );

  const InputField({
    super.key,
    required this.controller,
    this.hidden,
    this.prefixIcon,
    this.suffixIcon,
    this.hiddenToggle,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        obscureText: hidden ?? false,
        controller: controller,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Get.theme.hintColor,
          ),
          hintText: hintText,
          enabledBorder: customBorder,
          focusedBorder: customBorder,
          contentPadding: EdgeInsets.only(bottom: 5, left: 10),
          suffixIcon: hiddenToggle != null
              ? IconButton(
                  onPressed: () {
                    hiddenToggle!();
                  },
                  icon: Icon(
                    hidden == true
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: Get.theme.hintColor,
                  ),
                )
              : null,
          // fillColor: Get.theme.disabledColor,
        ),
      ),
    );
  }
}
