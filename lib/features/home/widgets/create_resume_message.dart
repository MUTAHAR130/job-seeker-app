import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/form_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';

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
              FormButton(
                buttonText: 'Create Resume',
                onPress: () {
                  homeController.changeMenu('generateResume');
                },
              ),
              SizedBox(height: 15),
              FormButton(
                buttonText: 'Upload Resume',
                invertedColor: true,
                onPress: () {
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
