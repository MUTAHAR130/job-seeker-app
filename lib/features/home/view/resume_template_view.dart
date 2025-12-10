import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/home/widgets/resume_template_widget.dart';

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
              child: Container(
                width: 128,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Get.theme.colorScheme.surface,
                ),
                child: DropdownButtonFormField(
                  value: 'All Templates',
                  style: TextStyle(
                    fontSize: 12,
                    color: Get.theme.colorScheme.tertiary,
                    fontWeight: FontWeight
                        .w400, // Make the selected text slightly bolder
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
                  items: templateOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {},
                ),
              ),
            ),
            SizedBox(height: 5),
            //will be in list view builder
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.generateResume);
              },
              child: ResumeTemplateWidget(
                onTap: (){Get.toNamed(AppRoutes.generateResume);},
                typeIcon: AppIcons.freeIcon,
                resumeAsset: 'assets/docs/Resume1.pdf',
                scoreIcon: AppIcons.p70Icon,
                typeProperties: '70% + Basic ATS Ready',
                typeTile: 'Modern Professional',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
