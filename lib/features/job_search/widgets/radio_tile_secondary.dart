import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:get/get.dart';

class RadioTileSecondary extends StatelessWidget {
  final String title;
  final bool isDefault;
  final int radioVal;
  final int groupVal;
  final Function onTap;

  const RadioTileSecondary({
    super.key,
    required this.title,
    required this.isDefault,
    required this.radioVal,
    required this.groupVal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(radioVal);
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        margin: EdgeInsets.only(bottom: 10),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Get.theme.colorScheme.surface,
          border: BoxBorder.all(color: Get.theme.colorScheme.outline),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                isDefault
                    ? SvgPicture.string(AppIcons.defaultIcon, height: 24)
                    : SizedBox(),
              ],
            ),
            Radio(
              value: radioVal,
              groupValue: groupVal,
              onChanged: (val) {
                onTap(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
