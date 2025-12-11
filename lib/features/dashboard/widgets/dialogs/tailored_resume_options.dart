import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/generate_resume_options.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/job_details_dialog.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/job_listing_dialog.dart';
import 'package:job_seeker/core/common/widgets/radio_tile.dart';

class TailoredResumeOptions extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  TailoredResumeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          topIcon: AppIcons.createResumeIcon,
          title: 'How would you like to create your resume?',
          onCancel: () {
            Get.back();
          },
          onBack: () {
            Get.back();
            Get.dialog(GenerateResumeOptions());
          },
          child: Column(
            children: [
              Obx(
                () => RadioTile(
                  radioVal: 1,
                  groupVal: resumeController.tailoredResumeRadioSelected.value,
                  title: 'Select from Job Listings',
                  subtitle:
                      'Choose a job directly from SmartResume’s internal listings to automatically tailor your resume.',
                  changeVal: resumeController.changeTailoredResumeRadio,
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => RadioTile(
                  radioVal: 2,
                  groupVal: resumeController.tailoredResumeRadioSelected.value,
                  title: 'Enter Job Details Manually',
                  subtitle:
                      'Provide the job title, company name, and description to generate a customized resume.',
                  changeVal: resumeController.changeTailoredResumeRadio,
                ),
              ),
              SizedBox(height: 10),
              ActionButton(
                buttonText: 'Continue',
                onPress: () {
                  if (resumeController.tailoredResumeRadioSelected.value == 1) {
                    Get.back();
                    Get.dialog(JobListingDialog());
                  } else {
                    Get.back();
                    Get.dialog(JobDetailsDialog(onBack: TailoredResumeOptions(),action: (){},));
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
