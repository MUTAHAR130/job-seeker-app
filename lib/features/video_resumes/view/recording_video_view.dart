import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/video_resumes/controller/record_video_controller.dart';

class RecordingVideoView extends StatelessWidget {
  final RecordVideoController recordVideoController =
      Get.find<RecordVideoController>();

  RecordingVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Record Video',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                // height: 60,
                decoration: BoxDecoration(
                  color: Get.theme.listTileTheme.selectedTileColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: BoxBorder.all(color: Get.theme.colorScheme.tertiary),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Ensure good lighting, maintain eye contact with the camera, speak clearly, and keep your video between 1-3 minutes.',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.close),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: SizedBox(
                  height: 400,
                  child: Center(child: Text('Live Recording Here \n Working on')),
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        'Script',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        recordVideoController.textScript,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
