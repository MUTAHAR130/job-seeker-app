import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/profile_picture.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/messages/models/message_model.dart';

class OtherChatTile extends StatelessWidget {
  final MessageModel data;

  const OtherChatTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.all(0),
      titleAlignment: ListTileTitleAlignment.top,
      horizontalTitleGap: 5,
      leading: ProfilePicture(
        radius: 20,
        pictureUrl: data.sender.profilePicture,
      ),
      title: Row(
        children: [
          SvgPicture.string(AppIcons.chatIcon, height: 16, width: 16),
          SizedBox(width: 5),
          Text(
            '${data.sender.fullName} - ${DateFormat.jm().format(data.createdAt)}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      subtitle: WhiteCurvedBox(
        child: Text(
          data.content,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
