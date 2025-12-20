import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/messages/controller/messages_controller.dart';
import 'package:job_seeker/features/messages/controller/threads_controller.dart';
import 'package:job_seeker/features/messages/widgets/local_chat_tile.dart';
import 'package:job_seeker/features/messages/widgets/no_chats_message.dart';
import 'package:job_seeker/features/messages/widgets/other_chat_tile.dart';

class ChatsView extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final ThreadsController threadsController = Get.find<ThreadsController>();
  final MessagesController messagesController = Get.put(MessagesController());

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
            // NoChatsMessage(),
            FutureBuilder(
              future: MessageListWidget(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!;
                } else if (snapshot.hasError) {
                  debugPrint('${snapshot.error}');
                  return const Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        "An Error Occurred",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return Expanded(child: const Center(child: CircularProgressIndicator()));
              },
            ),

            //debug
            Row(
              children: [
                Expanded(
                  child: InputField(
                    controller: messagesController.sendMessageTC,
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
                  onPress: () {
                    messagesController.sendMessage();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> MessageListWidget() async {
    if (messagesController.initial) {
      messagesController.selectedThread = threadsController.selectedThread;
      await messagesController.getMessages();
    }
    return GetBuilder(
      id: 'messageList',
      init: messagesController,
      builder: (controller) {
        return Expanded(
          child: ListView.builder(
            itemCount: messagesController.messageData.length,
            itemBuilder: (context, index) {
              if (messagesController.messageData[index].sender.id ==
                  homeController.currentUser.id) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LocalChatTile(
                      data: messagesController.messageData[index],
                    ),
                    SizedBox(height: 15),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OtherChatTile(
                      data: messagesController.messageData[index],
                    ),
                    SizedBox(height: 15),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
