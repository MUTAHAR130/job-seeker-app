import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/form_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';

class CreateResumeMessage extends StatelessWidget {
  const CreateResumeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCurvedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.string(AppIcons.createResumeIcon),
              SizedBox(height: 15),
              Text(
                'Build or Upload Resume',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                'Start fresh with SmartResume’s builder or upload your existing resume to check your ATS score.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15),
              FormButton(
                buttonText: 'Create Resume',
                onPress: () {
                  Get.back();
                },
              ),
              SizedBox(height: 15),
              FormButton(
                buttonText: 'Upload Resume',
                invertedColor: true,
                onPress: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
