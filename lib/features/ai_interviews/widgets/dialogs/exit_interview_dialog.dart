import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/routes/app_routes.dart';

class ExitInterviewDialog extends StatelessWidget {
  const ExitInterviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          secondary: true,
          onCancel: () {
            Get.back();
          },
          title: 'Exit Interview?',
          subTitle:
              'Your progress will be lost if you exit now. Are you sure you want to leave this interview session?',
          child: Column(
            children: [
              SizedBox(height: 15),
              ActionButton(
                inverted: true,
                buttonText: 'Continue Interview',
                onPress: () {
                  Get.back();
                },
              ),
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Exit Interview',
                onPress: () {
                  Get.until((route) => route.settings.name == AppRoutes.home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
