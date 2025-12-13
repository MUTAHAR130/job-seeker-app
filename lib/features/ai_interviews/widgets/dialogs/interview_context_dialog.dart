import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:job_seeker/features/ai_interviews/controller/ai_interview_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/radio_tile.dart';
import 'package:job_seeker/features/ai_interviews/widgets/dialogs/interview_job_list_dialog.dart';
import 'package:job_seeker/features/ai_interviews/widgets/dialogs/start_interview_dialog.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/job_details_dialog.dart';

class InterviewContextDialog extends StatelessWidget {
  final AIInterviewController aiInterviewController =
      Get.find<AIInterviewController>();

  InterviewContextDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          title: 'Select Interview Context',
          onBack: (){
            Get.back();
            Get.dialog(StartInterviewDialog());
          } ,
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
                    groupVal: aiInterviewController.interviewContextRadio.value,
                    title: 'Choose a job you\'ve applied to',
                    changeVal: aiInterviewController.changeInterviewContextRadio,
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  () => RadioTile(
                    radioVal: 2,
                    groupVal: aiInterviewController.interviewContextRadio.value,
                    title: 'Enter custom job details',
                    changeVal: aiInterviewController.changeInterviewContextRadio,
                  ),
                ),
                SizedBox(height: 10),
                ActionButton(
                  buttonText: 'Continue',
                  onPress: () {
                    if (aiInterviewController.interviewContextRadio.value == 1) {
                      Get.back();
                      Get.dialog(InterviewJobListDialog());
                    } else {
                      Get.dialog(
                        JobDetailsDialog(
                          buttonLabel: 'Start Mock Interview',
                          onBack: InterviewContextDialog(),
                          action: () {},
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
