import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/video_resumes/controller/record_video_controller.dart';

class RecordVideoView extends StatelessWidget {
  final RecordVideoController recordVideoController = Get.put(
    RecordVideoController(),
  );

  RecordVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Record Video',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 15),
            InputField(
              label: 'Video Title',
              mandatory: true,
              controller: recordVideoController.videoTitleTC,
              hintText: 'Enter Video Title',
            ),
            SizedBox(height: 15),
            LabeledDropDownMenu(
              label: 'Video Type',
              items: [],
              onChange: () {},
              hintText: 'Select',
            ),
            SizedBox(height: 15),
            InputField(
              label: 'Target Role',
              mandatory: true,
              controller: recordVideoController.videoTitleTC,
              hintText: 'Enter target role',
            ),
            SizedBox(height: 15),
            LabeledDropDownMenu(
              label: 'Generated Script',
              items: [],
              onChange: () {},
              hintText: 'Select',
            ),
            SizedBox(height: 15),
            ActionButton(
              buttonText: 'Continue',
              onPress: () {
                Get.toNamed(AppRoutes.recordingVideoView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
