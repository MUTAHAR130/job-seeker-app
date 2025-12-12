import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BubbleListWidget extends StatelessWidget {
  final String text;
  final bool? noOnTap;
  final Function onTap;

  const BubbleListWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.noOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Get.theme.listTileTheme.selectedTileColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
            SizedBox(width: noOnTap == true ? 0 : 5),
            noOnTap == true ? SizedBox() : Icon(Icons.close, size: 12),
          ],
        ),
      ),
    );
  }
}
