import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/bubble_list_widget.dart';
import 'package:job_seeker/core/common/widgets/progress_meter_widget.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/ai_interviews/controller/mock_interview_controller.dart';
import 'package:job_seeker/features/ai_interviews/widgets/answer_feedback_widget.dart';
import 'package:job_seeker/features/ai_interviews/widgets/answer_widget.dart';
import 'package:job_seeker/features/ai_interviews/widgets/dialogs/exit_interview_dialog.dart';

class MockInterviewView extends StatelessWidget {
  final MockInterviewController mockInterviewController = Get.put(
    MockInterviewController(),
  );

  MockInterviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'UI/UX Designer',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                subtitle: Text(
                  'Google - Written Mode',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                trailing: ActionButton(
                  width: 125,
                  height: 40,
                  inverted: true,
                  prefixIcon: AppIcons.exitIcon,
                  buttonText: 'Exit Interview',
                  onPress: () {
                    Get.dialog(ExitInterviewDialog());
                  },
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      'Question ${mockInterviewController.questionProgress.value} of 6',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  BubbleListWidget(
                    text: 'BEHAVIORAL',
                    noOnTap: true,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 15),
              Obx(
                () => ProgressMeterWidget(
                  currentValue: mockInterviewController.questionProgress.value,
                  maxValue: 6,
                ),
              ),
              SizedBox(height: 15),
              Obx(
                () => mockInterviewController.showFeedback.value
                    ? AnswerFeedbackWidget()
                    : AnswerWidget(
                        question:
                            'Tell me about a time when you had to work under pressure to meet a deadline. How did you handle it?',
                        timeSpent: '8:43',
                        onSubmit: () {
                          mockInterviewController.showFeedback.value = true;
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
