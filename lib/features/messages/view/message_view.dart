import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/messages/controller/threads_controller.dart';
import 'package:job_seeker/features/messages/widgets/message_tile.dart';
import 'package:job_seeker/features/messages/widgets/new_conversation_dialog.dart';


class MessageView extends StatelessWidget {
  final ThreadsController threadsController = Get.find<ThreadsController>();

  MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActionButton(
              height: 32,
              width: 151,
              prefixIcon: AppIcons.addIcon,
              buttonText: 'New Message',
              onPress: () {
                Get.dialog(NewConversationDialog());
              },
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WhiteCurvedBox(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.32,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SvgPicture.string(
                              AppIcons.highlightIcon,
                              height: 40,
                              width: 40,
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: SvgPicture.string(AppIcons.notesIcon),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          '00',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Job Related',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                WhiteCurvedBox(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.32,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SvgPicture.string(
                              AppIcons.highlightIcon,
                              height: 40,
                              width: 40,
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: SvgPicture.string(AppIcons.chatIcon),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          '01',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Outreach',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: ThreadListWidget(),
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
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> ThreadListWidget() async {
    if (threadsController.initial) {
      await threadsController.getThreads();
    }
    return GetBuilder(
      id: 'threadList',
      init: threadsController,
      builder: (controller) {
        return Expanded(
          child: ListView.builder(
            itemCount: controller.threadData.length,
            itemBuilder: (context, index) {
              return MessageTile(
                onTap: () {
                  threadsController.selectedThread =
                      threadsController.threadData[index].id;
                  Get.toNamed(AppRoutes.chatsView);
                },
                data: controller.threadData[index],
              );
            },
          ),
        );
      },
    );
  }
}
