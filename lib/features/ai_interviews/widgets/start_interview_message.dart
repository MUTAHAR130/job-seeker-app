import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/ai_interviews/widgets/dialogs/start_interview_dialog.dart';

class StartInterviewMessage extends StatelessWidget {
  const StartInterviewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          topIcon: AppIcons.highlightNotesIcon,
          title: 'No Interview History',
          subTitle:
              'Complete your first mock interview to see your history and track your progress',
          child: Column(
            children: [
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Start Mock Interview',
                onPress: () {
                  Get.dialog(StartInterviewDialog());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
