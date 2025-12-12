import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/video_resumes/controller/video_resumes_controller.dart';

class CreateScriptMessage extends StatelessWidget {
  final VideoResumesController videoResumesController =
      Get.find<VideoResumesController>();

  CreateScriptMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          topIcon: AppIcons.scriptIcon,
          title: 'No Script Yet',
          subTitle:
              'Generate your first AI-powered video script to prepare for your next video resume.',
          child: Column(
            children: [
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Generate Script',
                onPress: () {
                  videoResumesController.shownScriptMenu.value = 'showScripts';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
