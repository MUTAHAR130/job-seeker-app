import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/generate_resume_options.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/job_search/widgets/dialogs/apply_select_letter_dialog.dart';
import 'package:job_seeker/features/job_search/widgets/radio_tile_secondary.dart';

class ApplySelectResumeDialog extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  ApplySelectResumeDialog({super.key});

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
                        'Select Resume',
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
                    buttonText: 'Create new resume',
                    onPress: () {
                      Get.dialog(GenerateResumeOptions());
                    },
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: homeController.savedResumeData.isNotEmpty
                        ? 170
                        : 20,
                    child: homeController.savedResumeData.isNotEmpty
                        ? ListView.builder(
                            itemCount: homeController.savedResumeData.length,
                            itemBuilder: (context, index) {
                              return RadioTileSecondary(
                                title:
                                    homeController.savedResumeData[index].title,
                                isDefault:
                                    homeController
                                        .savedResumeData[index]
                                        .isDefault ??
                                    false,
                                radioVal: index,
                                groupVal: 1,
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
                        buttonText: 'Cancel',
                        onPress: () {
                          Get.back();
                        },
                      ),
                      SizedBox(width: 10),
                      ActionButton(
                        disabled: homeController.savedResumeData.isEmpty,
                        noBorder: homeController.savedResumeData.isEmpty,
                        width: 70,
                        buttonText: 'Continue',
                        onPress: () {
                          Get.back();
                          Get.dialog(ApplySelectLetterDialog());
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
