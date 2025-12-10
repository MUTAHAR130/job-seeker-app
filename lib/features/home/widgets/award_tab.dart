import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/date_selector_widget.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/home/controller/resume_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';

import '../../../core/common/widgets/multi_line_input_field.dart';

class AwardTab extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  AwardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Awards',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Get.theme.colorScheme.primary,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Get.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Visibility(
              visible: true, //shown when adding new section
              child: Column(
                children: [
                  WhiteCurvedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputField(
                          controller: resumeController.awardNameTC,
                          label: 'Award Title',
                          hintText: 'Enter certificate name',
                        ),
                        SizedBox(height: 15),
                        InputField(
                          controller: resumeController.awardOrganizationTC,
                          label: 'Organization',
                          hintText: 'Enter awarding organization',
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Issue Date',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        Obx(
                          () => DateSelectorField(
                            hintText: 'Select issue date',
                            currentDate: resumeController.startDate.value,
                            onDateSelected: resumeController.setStartDate,
                          ),
                        ),
                        SizedBox(height: 15),
                        MultiLineInputField(
                          controller: resumeController.awardDescTC,
                          label: 'Description',
                          hintText:
                          'Add details about the award (optional)',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ActionButton(
                      buttonText: 'Save Award',
                      onPress: () {},
                      bwidth: 90,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
