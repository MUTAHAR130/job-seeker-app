import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/home/controller/resume_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/radio_tile.dart';
import 'package:job_seeker/features/home/widgets/tailored_resume_options.dart';

class GenerateResumeOptions extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  GenerateResumeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          topIcon: AppIcons.createResumeIcon,
          title: 'Select Resume Type',
          onCancel: (){Get.back();},
          child: Column(
            children: [
              Obx(()=>RadioTile(
                radioVal: 1,
                groupVal: resumeController.generateResumeRadioSelected.value,
                title: 'General Resume',
                subtitle:
                    'A standard resume generated from your profile. Best for general applications.',
                changeVal: resumeController.changeGenerateResumeRadio,
              )),
              SizedBox(height: 10),
              Obx(()=>RadioTile(
                radioVal: 2,
                groupVal: resumeController.generateResumeRadioSelected.value,
                title: 'Job Tailored Resume',
                subtitle:
                    'A customized resume matched to a specific job description you provide.',
                changeVal: resumeController.changeGenerateResumeRadio,
              )),
              SizedBox(height: 10),
              ActionButton(
                buttonText: 'Generate Resume',
                onPress: () {
                  if(resumeController.generateResumeRadioSelected.value == 1){
                    Get.toNamed(AppRoutes.resumeTemplate);
                  } else {
                    Get.back();
                    Get.dialog(TailoredResumeOptions());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
