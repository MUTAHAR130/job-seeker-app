import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';

class CreateVideoResumeMessage extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  CreateVideoResumeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          topIcon: AppIcons.createVideoIcon,
          title: 'No Video Resumes Yet',
          subTitle:
              'Showcase your personality and communication skills — record or upload a video resume to make your profile stand out.',
          child: Column(
            children: [
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Record Video',
                onPress: () {
                  Get.toNamed(AppRoutes.recordVideView);
                },
              ),
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Upload Video',
                inverted: true,
                onPress: () {
                  Get.toNamed(AppRoutes.uploadVideoView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
