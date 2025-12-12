import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';

class LocalChatTile extends StatelessWidget {
  final String time;
  final String message;

  const LocalChatTile({super.key, required this.time, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'You - $time', //use formatted date time here
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        WhiteCurvedBox(
          color: Get.theme.listTileTheme.selectedTileColor,
          child: Text(
            message,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}