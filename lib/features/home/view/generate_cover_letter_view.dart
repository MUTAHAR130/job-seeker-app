import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/multi_line_input_field.dart';
import 'package:job_seeker/features/home/controller/resume_controller.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class GenerateCoverLetterView extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  GenerateCoverLetterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cover Letter',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      resumeController.changeTitle();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            resumeController.resumeTitle.value,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        SvgPicture.string(AppIcons.editIcon),
                      ],
                    ),
                  ),

                  ActionButton(
                    buttonText: 'Download PDF',
                    onPress: () {},
                    bheight: 32,
                    bwidth: 100,
                  ),
                ],
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 342,
                width: double.infinity,
                child: SfPdfViewer.asset('assets/docs/Resume1.pdf'),
              ),
              SizedBox(height: 15),
              Text(
                'Personal Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              InputField(
                controller: resumeController.nameFieldTC,
                label: 'Full Name',
                mandatory: true,
                hintText: 'Enter full name',
              ),
              SizedBox(height: 15),
              InputField(
                controller: resumeController.emailFieldTC,
                label: 'Email',
                mandatory: true,
                hintText: 'Enter email',
              ),
              SizedBox(height: 15),
              InputField(
                controller: resumeController.addressFieldTC,
                label: 'Address',
                mandatory: true,
                hintText: 'Enter full address',
              ),
              SizedBox(height: 15),
              InputField(
                controller: resumeController.phoneFieldTC,
                label: 'Phone Number',
                mandatory: true,
                hintText: 'Enter phone number',
              ),
              SizedBox(height: 15),
              Text(
                'Personal Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Text(
                '3–4 paragraphs explaining why you\'re the perfect candidate for a specific job',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              MultiLineInputField(
                controller: resumeController.workDescTC,
                hintText:
                    'Write a short summary about your professional background',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
