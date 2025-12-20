import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/messages/models/message_model.dart';

class LocalChatTile extends StatelessWidget {
  final MessageModel data;

  const LocalChatTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'You - ${DateFormat.jm().format(data.createdAt)}', //use formatted date time here
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        WhiteCurvedBox(
          color: Get.theme.listTileTheme.selectedTileColor,
          child: Text(
            data.content,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}