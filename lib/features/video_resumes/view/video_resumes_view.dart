import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/video_resumes/controller/video_resumes_controller.dart';
import 'package:job_seeker/features/video_resumes/widgets/create_script_message.dart';
import 'package:job_seeker/features/video_resumes/widgets/create_video_resume_message.dart';
import 'package:job_seeker/features/video_resumes/widgets/saved_script_list.dart';
import 'package:job_seeker/features/video_resumes/widgets/saved_video_list.dart';

class VideoResumesView extends StatelessWidget {
  final VideoResumesController videoResumesController =
      Get.find<VideoResumesController>();

  VideoResumesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2, top: 5),
                child: TabBar(
                  splashFactory: NoSplash.splashFactory,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Get.theme.hintColor,
                  dividerColor: Colors.transparent,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3.0),
                    insets: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  tabAlignment: TabAlignment.start,

                  tabs: const [
                    Tab(text: "Video Resumes"),
                    Tab(text: "Script Library"),
                  ],
                ),
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    Obx(() {
                      if (videoResumesController.shownVideoResumeMenu.value ==
                          'createVideo') {
                        return CreateVideoResumeMessage();
                      } else {
                        return SavedVideoList();
                      }
                    }),
                    Obx(() {
                      if (videoResumesController.shownScriptMenu.value ==
                          'createScript') {
                        return CreateScriptMessage();
                      } else {
                        return SavedScriptList();
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
