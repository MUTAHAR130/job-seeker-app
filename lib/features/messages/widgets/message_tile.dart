import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/profile_picture.dart';
import 'package:job_seeker/features/messages/models/thread_model.dart';

class MessageTile extends StatelessWidget {
  final ThreadModel data;
  final Function onTap;

  const MessageTile({super.key, required this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: Get.theme.colorScheme.outline),
        ListTile(
          onTap: () {
            onTap();
          },
          dense: true,
          leading: ProfilePicture(
            pictureUrl: data.lastMessage?.sender.avatar,
            name: data.lastMessage?.sender.name,
            radius: 20,
          ),
          title: Row(
            children: [
              SvgPicture.string(AppIcons.chatIcon, height: 16, width: 16),
              SizedBox(width: 5),
              Text(
                data.lastMessage!.sender.name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          subtitle: Text(
            data.lastMessage!.content,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Get.theme.hintColor,
            ),
          ),
        ),
      ],
    );
  }
}
