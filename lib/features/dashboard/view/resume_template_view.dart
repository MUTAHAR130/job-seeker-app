import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/dashboard/widgets/resume_template_widget.dart';

class ResumeTemplateView extends StatelessWidget {
  final List<String> templateOptions = [
    'All Templates',
    'ATS Optimized',
    'Creative',
    'Professional',
  ];

  ResumeTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Resume Detail',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resume Templates',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              'Choose a template for your resume. You can preview, edit, and download after selection.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: LabeledDropDownMenu(
                items: templateOptions,
                onChange: () {},
                defaultValue: 'All Templates',
                hintText: '',
                height: 32,
                width: 128,
              ),
            ),
            SizedBox(height: 5),
            //will be in list view builder
            Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.generateResume);
                    },
                    child: ResumeTemplateWidget(
                      onTap: () {
                        Get.toNamed(AppRoutes.generateResume);
                      },
                      typeIcon: AppIcons.freeIcon,
                      resumeAsset: 'assets/docs/Resume1.pdf',
                      score: 70,
                      typeProperties: '70% + Basic ATS Ready',
                      typeTile: 'Modern Professional',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
