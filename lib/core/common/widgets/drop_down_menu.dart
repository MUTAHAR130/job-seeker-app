import 'package:dropdown_button2/dropdown_button2.dart';
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
  final Rx<String> selectedValue = ''.obs;

  LabeledDropDownMenu({
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
  }) {
    selectedValue.value = defaultValue ?? '';
  }

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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Get.theme.colorScheme.surface,
            border: BoxBorder.all(color: Get.theme.colorScheme.outline),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(
              () => DropdownButton2(
                underline: const SizedBox.shrink(),
                isDense: true,
                value: selectedValue.value,
                buttonStyleData: ButtonStyleData(
                  height: height ?? 48,
                  width: width ?? double.infinity,
                ),
                dropdownStyleData: DropdownStyleData(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 25,
                  padding: EdgeInsets.all(0),
                ),
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
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Text(value)),
                  );
                }).toList(),
                onChanged: (val) {
                  selectedValue.value = val ?? '';
                  onChange();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
