import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/home/widgets/generate_resume_options.dart';

class CreateResumeMessage extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  CreateResumeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          topIcon: AppIcons.createResumeIcon,
          title: 'Build or Upload Resume',
          subTitle:
              'Start fresh with SmartResume’s builder or upload your existing resume to check your ATS score.',
          child: Column(
            children: [
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Create Resume',
                onPress: () {
                  Get.dialog(GenerateResumeOptions());
                },
              ),
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Upload Resume',
                invertedColor: true,
                onPress: () {
                  //debug
                  homeController.shownResumeMenu.value = 'resumeList';
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
