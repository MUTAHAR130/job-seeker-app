import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';

class OtherChatTile extends StatelessWidget {
  final String profilePicture;
  final String time;
  final String name;
  final String message;

  const OtherChatTile({
    super.key,
    required this.profilePicture,
    required this.time,
    required this.name,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.all(0),
      titleAlignment: ListTileTitleAlignment.top,
      horizontalTitleGap: 5,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(profilePicture),
      ),
      title: Row(
        children: [
          SvgPicture.string(AppIcons.chatIcon, height: 16, width: 16),
          SizedBox(width: 5),
          Text(
            '$name - $time',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      subtitle: WhiteCurvedBox(
        child: Text(
          message,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
