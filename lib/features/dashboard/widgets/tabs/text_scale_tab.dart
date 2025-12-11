import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:job_seeker/core/common/widgets/value_display_slider.dart';

class TextScaleTab extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  TextScaleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Font',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        SizedBox(height: 10),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Get.theme.colorScheme.surface,
          ),
          child: DropdownButtonFormField(
            hint: Text('Select'),
            style: TextStyle(
              fontSize: 12,
              color: Get.theme.colorScheme.tertiary,
              fontWeight:
                  FontWeight.w400, // Make the selected text slightly bolder
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),

              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              labelText: null,
            ),
            items: [],
            onChanged: (val) {},
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Font Size',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        Obx(
          () => ValueDisplaySlider(
            min: 1,
            max: 20,
            roundOff: true,
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
              () => ValueDisplaySlider(
            min: 0.1,
            max: 0.4,
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
