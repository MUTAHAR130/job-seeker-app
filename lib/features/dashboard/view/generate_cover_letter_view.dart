import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/multi_line_input_field.dart';
import 'package:job_seeker/features/dashboard/controller/cover_letter_controller.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class GenerateCoverLetterView extends StatelessWidget {
  final CoverLetterController coverLetterController =
      Get.find<CoverLetterController>();

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
                      coverLetterController.changeTitle();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            coverLetterController.coverTitle.value,
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
                    height: 32,
                    width: 100,
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
                controller: coverLetterController.nameFieldTC,
                label: 'Full Name',
                mandatory: true,
                hintText: 'Enter full name',
              ),
              SizedBox(height: 15),
              InputField(
                controller: coverLetterController.emailFieldTC,
                label: 'Email',
                mandatory: true,
                hintText: 'Enter email',
              ),
              SizedBox(height: 15),
              InputField(
                controller: coverLetterController.addressFieldTC,
                label: 'Address',
                mandatory: true,
                hintText: 'Enter full address',
              ),
              SizedBox(height: 15),
              InputField(
                controller: coverLetterController.phoneFieldTC,
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
                controller: coverLetterController.workDescTC,
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
