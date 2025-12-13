import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioTile extends StatelessWidget {
  final int radioVal;
  final int groupVal;
  final String title;
  final String? subtitle;
  final Function changeVal;

  const RadioTile({
    super.key,
    required this.radioVal,
    required this.groupVal,
    required this.title,
    required this.changeVal,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeVal(radioVal);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: radioVal == groupVal
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.outline,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Radio(
                value: radioVal,
                groupValue: groupVal,
                onChanged: (value) {
                  changeVal(value);
                },
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
