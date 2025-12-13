import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/multi_line_input_field.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/ai_interviews/controller/ai_interview_controller.dart';
import 'package:job_seeker/features/ai_interviews/controller/mock_interview_controller.dart';
import 'package:get/get.dart';

class AnswerWidget extends StatelessWidget {
  final String question;
  final String timeSpent;
  final Function onSubmit;
  final MockInterviewController mockInterviewController =
      Get.find<MockInterviewController>();
  final AIInterviewController aiInterviewController =
      Get.find<AIInterviewController>();

  AnswerWidget({
    super.key,
    required this.question,
    required this.timeSpent,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhiteCurvedBox(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  question,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: 5),
              Row(
                children: [
                  Icon(Icons.watch_later_outlined),
                  Text(
                    timeSpent,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        aiInterviewController.responseModeRadio.value == 1
            ? Column(
                children: [
                  MultiLineInputField(
                    controller: mockInterviewController.answerTC,
                    hintText: 'Type your answer here',
                    expandable: true,
                  ),
                  SizedBox(height: 15),
                  ActionButton(
                    buttonText: 'Submit Answer',
                    onPress: () {
                      onSubmit();
                    },
                  ),
                ],
              )
            : WhiteCard(
                topIcon: AppIcons.highlightMircophoneIcon,
                title: 'Ready to Record',
                subTitle:
                    'Click the button below to start recording your answer',
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      ActionButton(
                        buttonText: 'Start Recording',
                        onPress: () {
                          onSubmit();
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
