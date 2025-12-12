import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/messages/widgets/local_chat_tile.dart';
import 'package:job_seeker/features/messages/controller/message_controller.dart';
import 'package:job_seeker/features/messages/widgets/no_chats_message.dart';
import 'package:job_seeker/features/messages/widgets/other_chat_tile.dart';

class ChatsView extends StatelessWidget {
  final MessageController messageController = Get.find<MessageController>();

  ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          dense: true,
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/temp.jpg'),
          ),
          title: Row(
            children: [
              SvgPicture.string(AppIcons.chatIcon, height: 16, width: 16),
              SizedBox(width: 5),
              Text(
                'Emily Johnson',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          subtitle: Text(
            'Tech Corp.Inc',
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Get.theme.hintColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            LocalChatTile(
              time: '9:20 AM',
              message:
                  'Hi Emily! I noticed you work at TechCorp and wanted to connect. I\'m very interested in opportunities at your company.',
            ),
            OtherChatTile(
              profilePicture: 'assets/images/temp.jpg',
              name: 'Emily Johnson',
              time: '9:00 AM',
              message:
                  'Hi Alex! Thanks for reaching out. I\'d be happy to chat about potential opportunities. Let me know what type of roles you\'re looking for.',
            ),
            NoChatsMessage(),
            Expanded(
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) {
                  return SizedBox();
                },
              ),
            ),

            //debug
            Row(
              children: [
                Expanded(
                  child: InputField(
                    controller: messageController.sendMessageTC,
                    hintText: 'Type a message',
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.string(AppIcons.attachIcon),
                ),
                ActionButton(
                  height: 40,
                  width: 40,
                  prefixIcon: AppIcons.sendIcon,
                  buttonText: '',
                  onPress: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
