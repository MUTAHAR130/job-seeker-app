import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/dashboard/controller/cover_letter_controller.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/job_details_dialog.dart';
import 'package:job_seeker/core/common/widgets/radio_tile.dart';

class GenerateCoverLetterOptions extends StatelessWidget {
  final CoverLetterController coverLetterController =
      Get.find<CoverLetterController>();
  final HomeController homeController = Get.find<HomeController>();

  GenerateCoverLetterOptions({super.key});

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
          child: Column(
            children: [
              Obx(
                () => RadioTile(
                  radioVal: 1,
                  groupVal: coverLetterController.generateLetterRadioSelected.value,
                  title: 'Select from Job Listings',
                  subtitle:
                      'Choose a job directly from SmartResume’s internal listings to automatically tailor your resume.',
                  changeVal: coverLetterController.changeLetterRadio,
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => RadioTile(
                  radioVal: 2,
                  groupVal: coverLetterController.generateLetterRadioSelected.value,
                  title: 'Enter Job Details Manually',
                  subtitle:
                      'Provide the job title, company name, and description to generate a customized resume.',
                  changeVal: coverLetterController.changeLetterRadio,
                ),
              ),
              SizedBox(height: 10),
              ActionButton(
                buttonText: 'Continue',
                onPress: () {
                  if (coverLetterController.generateLetterRadioSelected.value == 1) {
                    Get.back();
                    homeController.shownLetterMenu.value = 'letterList';
                  } else {
                    Get.back();
                    Get.dialog(
                      JobDetailsDialog(
                        buttonLabel: 'Generate Resume',
                        onBack: GenerateCoverLetterOptions(),
                        action: () {
                          Get.toNamed(AppRoutes.coverLetterSelectResume);
                        },
                      ),
                    );
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
