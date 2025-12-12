import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';

class MessageTile extends StatelessWidget {
  final String profilePic;
  final String name;
  final String lastMessage;
  final Function onTap;

  const MessageTile({
    super.key,
    required this.profilePic,
    required this.name,
    required this.lastMessage,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: Get.theme.colorScheme.outline),
        ListTile(
          onTap: (){onTap();},
          dense: true,
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(profilePic),
          ),
          title: Row(
            children: [
              SvgPicture.string(AppIcons.chatIcon, height: 16, width: 16),
              SizedBox(width: 5),
              Text(
                name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          subtitle: Text(
            lastMessage,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
                color: Get.theme.hintColor),
          ),
        ),
      ],
    );
  }
}
