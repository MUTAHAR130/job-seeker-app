import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/generate_cover_letter_options.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/job_search/widgets/dialogs/apply_preview_dialog.dart';
import 'package:job_seeker/features/job_search/widgets/dialogs/apply_select_resume_dialog.dart';
import 'package:job_seeker/features/job_search/widgets/radio_tile_secondary.dart';

class ApplySelectLetterDialog extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  ApplySelectLetterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: WhiteCurvedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Cover Letter',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close, size: 25),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ActionButton(
                    inverted: true,
                    noBorder: true,
                    bgColor: Get.theme.scaffoldBackgroundColor,
                    buttonText: 'Create new cover letter',
                    onPress: () {
                      Get.dialog(GenerateCoverLetterOptions());
                    },
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: homeController.savedCoverLetterData.isNotEmpty
                        ? 170
                        : 20,
                    child: homeController.savedCoverLetterData.isNotEmpty
                        ? ListView.builder(
                            itemCount: homeController.savedResumeData.length,
                            itemBuilder: (context, index) {
                              return RadioTileSecondary(
                                title: homeController
                                    .savedCoverLetterData[index]
                                    .title,
                                isDefault: homeController
                                    .savedCoverLetterData[index]
                                    .isDefault,
                                radioVal: index,
                                groupVal: 0,
                                onTap: () {},
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              'No resume found. Create one to continue.',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ActionButton(
                        inverted: true,
                        noBorder: true,
                        width: 70,
                        buttonText: 'Back',
                        onPress: () {
                          Get.back();
                          Get.dialog(ApplySelectResumeDialog());
                        },
                      ),
                      SizedBox(width: 10),
                      ActionButton(
                        width: 70,
                        buttonText: 'Continue',
                        onPress: () {
                          Get.back();
                          Get.dialog(ApplyPreviewDialog());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
