import 'package:flutter/material.dart';
import 'package:job_seeker/features/video_resumes/controller/video_resumes_controller.dart';
import 'package:job_seeker/features/video_resumes/widgets/saved_video_widget.dart';
import 'package:get/get.dart';

class SavedVideoList extends StatelessWidget {
  final VideoResumesController videoResumesController =
      Get.find<VideoResumesController>();

  SavedVideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoResumesController.savedVideoData.length,
      itemBuilder: (context, index) {
        return SavedVideoWidget(
          asset: videoResumesController.savedVideoData[index].resumeAsset,
          title: videoResumesController.savedVideoData[index].title,
          onTap: () {},
          index: index,
          date: videoResumesController.savedVideoData[index].date,
        );
      },
    );
  }
}
