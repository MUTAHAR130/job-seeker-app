import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/features/dashboard/controller/new_resume_controller.dart';
import 'package:job_seeker/core/common/widgets/value_display_slider.dart';

class TextScaleTab extends StatelessWidget {
  final NewResumeController resumeController = Get.find<NewResumeController>();

  TextScaleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledDropDownMenu(
          label: 'Font',
          items: [],
          onChange: () {},
          hintText: 'Select',
        ),
        SizedBox(height: 10),
        Text(
          'Font Size',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        Obx(
          () => CustomValueDisplaySlider(
            min: 1,
            max: 20,
            roundOff: true,
            valuePrefix: '',
            valueSuffix: 'px',
            currentSliderValue: resumeController.textScale.value,
            onChange: resumeController.changeTextScale,
          ),
        ),
        Text(
          'Spacing',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        Obx(
          () => CustomValueDisplaySlider(
            min: 0.1,
            max: 0.4,
            valuePrefix: '',
            valueSuffix: 'in',
            roundOff: false,
            currentSliderValue: resumeController.spaceSize.value,
            onChange: resumeController.changeSpaceSize,
          ),
        ),
      ],
    );
  }
}
