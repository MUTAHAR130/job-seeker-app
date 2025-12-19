import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/dashboard/controller/new_resume_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/radio_tile.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/tailored_resume_options.dart';

class GenerateResumeOptions extends StatelessWidget {
  final NewResumeController newResumeController = Get.find<NewResumeController>();

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
                groupVal: newResumeController.generateResumeRadioSelected.value,
                title: 'General Resume',
                subtitle:
                    'A standard resume generated from your profile. Best for general applications.',
                changeVal: newResumeController.changeGenerateResumeRadio,
              )),
              SizedBox(height: 10),
              Obx(()=>RadioTile(
                radioVal: 2,
                groupVal: newResumeController.generateResumeRadioSelected.value,
                title: 'Job Tailored Resume',
                subtitle:
                    'A customized resume matched to a specific job description you provide.',
                changeVal: newResumeController.changeGenerateResumeRadio,
              )),
              SizedBox(height: 10),
              ActionButton(
                buttonText: 'Generate Resume',
                onPress: () {
                  if(newResumeController.generateResumeRadioSelected.value == 1){
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
