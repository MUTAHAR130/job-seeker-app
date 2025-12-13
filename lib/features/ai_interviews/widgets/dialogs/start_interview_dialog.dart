import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:job_seeker/features/ai_interviews/controller/ai_interview_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/radio_tile.dart';
import 'package:job_seeker/features/ai_interviews/widgets/dialogs/interview_context_dialog.dart';

class StartInterviewDialog extends StatelessWidget {
  final AIInterviewController aiInterviewController =
      Get.find<AIInterviewController>();

  StartInterviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          secondary: true,
          title: 'Choose how you want to respond during the interview',
          onCancel: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Obx(
                  () => RadioTile(
                    radioVal: 1,
                    groupVal: aiInterviewController.responseModeRadio.value,
                    title: 'Written Response Mode',
                    subtitle:
                        'Type your answers in a structured text field with multiline support and autosave.',
                    changeVal: aiInterviewController.changeResponseModeRadio,
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  () => RadioTile(
                    radioVal: 2,
                    groupVal: aiInterviewController.responseModeRadio.value,
                    title: 'Voice Response Mode',
                    subtitle:
                        'Record your answers using your device\'s microphone. AI analyzes clarity, confidence, and structure.',
                    changeVal: aiInterviewController.changeResponseModeRadio,
                  ),
                ),
                SizedBox(height: 10),
                ActionButton(buttonText: 'Continue', onPress: () {
                  Get.back();
                  Get.dialog(InterviewContextDialog());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
