import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final bool? mandatory;
  final String? hintText;
  final bool? hidden;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? svgPrefixIcon;
  final Function? hiddenToggle;
  static final customBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Get.theme.colorScheme.outline),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  const InputField({
    super.key,
    required this.controller,
    this.label,
    this.mandatory,
    this.hidden,
    this.prefixIcon,
    this.suffixIcon,
    this.hiddenToggle,
    this.hintText,
    this.svgPrefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        label != null
            ? Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(text: label!),
                      TextSpan(
                        text: mandatory == true ? '*' : '',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox(),
        SizedBox(height: label != null ? 8 : 0),
        SizedBox(
          height: 48,
          child: TextFormField(
            obscureText: hidden ?? false,
            controller: controller,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            decoration: InputDecoration(
              fillColor: Get.theme.colorScheme.surface,
              filled: true,
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Get.theme.hintColor,
              ),
              hintText: hintText,
              border: customBorder,
              enabledBorder: customBorder,
              focusedBorder: customBorder,
              contentPadding: EdgeInsets.only(bottom: 5, left: 10),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon!)
                  : svgPrefixIcon != null
                  ? SizedBox(
                      height: 8,
                      width: 8,
                      child: SvgPicture.string(
                        svgPrefixIcon!,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
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
        ),
      ],
    );
  }
}
