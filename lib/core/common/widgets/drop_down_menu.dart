import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabeledDropDownMenu extends StatelessWidget {
  final String? label;
  final double? fontSize;
  final double? height;
  final double? width;
  final bool? mandatory;
  final List<String> items;
  final Function onChange;
  final String hintText;
  final String? defaultValue;

  const LabeledDropDownMenu({
    super.key,
    this.label,
    this.fontSize,
    this.height,
    this.width,
    required this.items,
    required this.onChange,
    required this.hintText,
    this.defaultValue,
    this.mandatory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        label != null
            ? Text.rich(
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
              )
            : SizedBox(),
        SizedBox(height: label != null ? 8 : 0),
        Container(
          height: height ?? 48,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Get.theme.colorScheme.surface,
            border: BoxBorder.all(color: Get.theme.colorScheme.outline),
          ),
          child: DropdownButtonFormField(
            value: defaultValue,
            hint: Text(
              hintText,
              style: TextStyle(
                color: Get.theme.hintColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            style: TextStyle(
              fontSize: 12,
              color: Get.theme.colorScheme.tertiary,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),

              border: OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              labelText: null,
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (val) {
              onChange();
            },
          ),
        ),
      ],
    );
  }
}
