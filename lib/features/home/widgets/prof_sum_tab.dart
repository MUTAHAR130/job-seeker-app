import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/multi_line_input_field.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/home/controller/resume_controller.dart';
import 'package:get/get.dart';

class ProfSumTab extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  ProfSumTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Professional Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            WhiteCurvedBox(
              margin: 0,
              child: MultiLineInputField(
                controller: resumeController.profSumTC,
                label: 'Professional Summary',
                mandatory: true,
                hintText:
                    'Write a short summary about your professional background',
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ActionButton(
                buttonText: 'Save Professional Summary',
                onPress: () {},
                bwidth: 190,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
