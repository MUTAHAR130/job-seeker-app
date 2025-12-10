import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/multi_line_input_field.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/home/controller/resume_controller.dart';
import 'package:get/get.dart';

class JobDetailsDialog extends StatelessWidget {
  final Widget onBack;
  final Function action;
  final ResumeController resumeController = Get.find<ResumeController>();

  JobDetailsDialog({super.key, required this.onBack, required this.action});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCurvedBox(
          margin: 24,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                          Get.dialog(onBack);
                        },
                        icon: SvgPicture.string(AppIcons.backIcon),
                      ),
                      Text(
                        'Job Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
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
              InputField(
                controller: resumeController.jobDialogTitleTC,
                label: 'Job Title',
                mandatory: true,
                hintText: 'Enter job title',
              ),
              SizedBox(height: 15),
              InputField(
                controller: resumeController.jobDialogCompanyTC,
                label: 'Company Name',
                mandatory: true,
                hintText: 'Enter company name',
              ),
              SizedBox(height: 15),
              MultiLineInputField(
                controller: resumeController.jobDialogDescTC,
                label: 'Job Description',
                mandatory: true,
                hintText: 'Write a short summary about the job experience',
              ),
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Generate Resume',
                onPress: () {
                  action();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
