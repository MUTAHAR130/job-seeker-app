import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiLineInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool? expandable;
  final String? label;
  final bool? mandatory;
  final String? hintText;
  static final customBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Get.theme.colorScheme.outline),
    borderRadius: const BorderRadius.all(Radius.circular(4)),
  );

  const MultiLineInputField({
    super.key,
    required this.controller,
    this.label,
    this.mandatory,
    this.hintText,
    this.expandable,
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
        TextFormField(
          controller: controller,
          minLines: expandable == true ? 7 : null,
          maxLines: expandable == true ? null : 7,
          decoration: InputDecoration(
            fillColor: Get.theme.colorScheme.surface,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: customBorder,
            focusedBorder: customBorder,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Get.theme.hintColor,
            ),
          ),
        ),
      ],
    );
  }
}
