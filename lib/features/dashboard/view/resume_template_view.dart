import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/dashboard/controller/new_resume_controller.dart';
import 'package:job_seeker/features/dashboard/widgets/resume_template_widget.dart';

class ResumeTemplateView extends StatelessWidget {
  final NewResumeController newResumeController =
      Get.find<NewResumeController>();
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
            FutureBuilder(
              future: TemplateList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!;
                } else if (snapshot.hasError) {
                  debugPrint('${snapshot.error}');
                  return const Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        "An Error Occurred",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> TemplateList() async {
    if (newResumeController.initial) {
      await newResumeController.getResumeTemplates();
    }
    return Expanded(
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: newResumeController.templateData.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              newResumeController.selectedTemplate =
                  newResumeController.templateData[index].id;
              debugPrint('here');
              newResumeController.resumeGenerationSetup();
              Get.toNamed(AppRoutes.generateResume);
            },
            child: ResumeTemplateWidget(
              data: newResumeController.templateData[index],
            ),
          );
        },
      ),
    );
  }
}
