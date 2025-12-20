import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/common/widgets/multi_line_input_field.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/messages/controller/threads_controller.dart';

class NewConversationDialog extends StatelessWidget {
  final ThreadsController threadsController = Get.find<ThreadsController>();

  NewConversationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          secondary: true,
          title: 'Start New Conversation',
          onCancel: () {
            Get.back();
          },
          child: Column(
            children: [
              LabeledDropDownMenu(
                label: 'Message Type',
                mandatory: true,
                items: threadsController.threadTypes.keys.toList(),
                onChange: threadsController.changeType,
                defaultValue: 'General Outreach',
                hintText: 'Select message type',
                itemHeight: 35,
              ),
              SizedBox(height: 15),
              LabeledDropDownMenu(
                label: 'To',
                mandatory: true,
                items: [],
                onChange: () {},
                hintText: 'Select who to message',
              ),
              SizedBox(height: 15),
              MultiLineInputField(
                label: 'Message',
                mandatory: true,
                controller: threadsController.newThreadTC,
                hintText: 'Enter message',
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                    inverted: true,
                    noBorder: true,
                    width: 70,
                    buttonText: 'Cancel',
                    onPress: () {
                      Get.back();
                    },
                  ),
                  SizedBox(width: 10),
                  ActionButton(
                    width: 120,
                    buttonText: 'Send Message',
                    onPress: () {
                      Get.back();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
