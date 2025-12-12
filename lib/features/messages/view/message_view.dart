import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/messages/widgets/message_tile.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

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
              onPress: () {},
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
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return MessageTile(
                    onTap: (){Get.toNamed(AppRoutes.chatsView);},
                    profilePic: 'assets/images/temp.jpg',
                    name: 'Emily Johnson',
                    lastMessage:
                        'Hi Alex! Thanks for reaching out. I\'d be happy to chat about potential opportunities. Let me know what type of roles you\'re looking for.',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
