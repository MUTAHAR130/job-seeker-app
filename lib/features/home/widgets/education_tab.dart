import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/date_selector_widget.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/option_toggle_tile.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/resume_detail_tile.dart';

class EducationTab extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  EducationTab({super.key});

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
                  'Education',
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
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              const TextSpan(text: 'Degree'),
                              const TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        InputField(
                          controller: homeController.degreeTitleTC,
                          hintText: 'Enter degree',
                        ),
                        SizedBox(height: 15),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              const TextSpan(text: 'Institute'),
                              const TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        InputField(
                          controller: homeController.instituteTC,
                          hintText: 'Enter institute',
                        ),
                        SizedBox(height: 15),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              const TextSpan(text: 'Start Date'),
                              const TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Obx(
                          () => DateSelectorField(
                            hintText: 'Select start date',
                            currentDate: homeController.startDate.value,
                            onDateSelected: homeController.setStartDate,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              const TextSpan(text: 'End Date'),
                              const TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Obx(
                          () => DateSelectorField(
                            hintText: 'Select end date',
                            currentDate: homeController.endDate.value,
                            onDateSelected: homeController.setEndDate,
                          ),
                        ),
                        SizedBox(height: 15),
                        OptionToggleTile(
                          toggleValue: true,
                          toggleFunction: (val) {},
                          tileText: 'Currently study here',
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              const TextSpan(text: 'Description'),
                              const TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: homeController.eduDescTC,
                          maxLines: 7,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: const OutlineInputBorder(),
                            label: Text(
                              'Write a short summary about your education',
                            ),
                            labelStyle: TextStyle(
                              color: Get.theme.colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ActionButton(
                      buttonText: 'Save Education',
                      onPress: () {},
                      bwidth: 100,
                    ),
                  ),
                ],
              ),
            ),
            ResumeDetailTile(
              titleText: 'Bachelors of science in Software Engineering at Sindh madrassatul islam university (SMIU)',
              onTapDelete: () {},
              subTitleText: 'Aug 2022 - Present',
            ),
          ],
        ),
      ),
    );
  }
}
