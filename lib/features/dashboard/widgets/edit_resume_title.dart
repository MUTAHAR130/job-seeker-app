import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';

class EditTitle extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  EditTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCurvedBox(
          margin: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit Title',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                controller: resumeController.resumeTitleTC,
                label: 'Title',
                mandatory: true,
                hintText: 'Enter name',
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                    bwidth: 50,
                    buttonText: 'Cancel',
                    invertedColor: true,
                    noBorder: true,
                    onPress: () {
                      Get.back();
                    },
                  ),
                  SizedBox(width: 10),
                  ActionButton(
                    bwidth: 50,
                    buttonText: 'Save',
                    onPress: () {
                      resumeController.resumeTitle.value = resumeController
                          .resumeTitleTC
                          .text
                          .trim();
                      resumeController.resumeTitleTC.clear();
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
