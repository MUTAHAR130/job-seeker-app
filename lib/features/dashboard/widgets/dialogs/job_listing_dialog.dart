import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/tailored_resume_options.dart';

class JobListingDialog extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  JobListingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCurvedBox(
          margin: 24,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      Get.dialog(TailoredResumeOptions());
                    },
                    icon: SvgPicture.string(AppIcons.backIcon),
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
                controller: resumeController.jobListingSearchTC,
                prefixIcon: Icons.search,
                hintText: 'Search Job Title',
              ),
              SizedBox(height: 15),
              InputField(
                controller: resumeController.jobListingLocationTC,
                prefixIcon: Icons.location_on_outlined,
                hintText: 'Search Location',
              ),
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Filter',
                invertedColor: true,
                prefixIcon: AppIcons.sliderBarsIcon,
                onPress: () {},
              ),
              //jobs list view here
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Generate Resume',
                bwidth: 120,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
