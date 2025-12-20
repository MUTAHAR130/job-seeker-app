import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/generate_resume_options.dart';
import 'package:job_seeker/features/dashboard/widgets/resume_list.dart';

class CoverLetterSelectResumeView extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  CoverLetterSelectResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Select Resume',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButton(
        buttonText: 'Generate',
        width: MediaQuery.sizeOf(context).width * 0.85,
        onPress: () {
          Get.toNamed(AppRoutes.generateCoverLetter);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Resume',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                'Choose a resume for your cover letter. You can preview, edit, and download after selection.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 5),
              //will be in list view builder
              Obx(() {
                if (resumeController.resumeData.isNotEmpty) {
                  return ResumeList(
                    resumeData: resumeController.resumeData,
                    isRadio: true,
                    groupVal: 0,
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: WhiteCard(
                      topIcon: AppIcons.dropInIcon,
                      title: 'Resume Required',
                      subTitle:
                          'You need at least one resume to generate a cover letter. Please create a resume before continuing.',
                      child: ActionButton(
                        buttonText: 'create Resume',
                        onPress: () {
                          Get.dialog(GenerateResumeOptions());
                        },
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
