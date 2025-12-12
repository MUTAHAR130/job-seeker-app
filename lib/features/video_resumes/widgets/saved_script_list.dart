import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/video_resumes/controller/video_resumes_controller.dart';
import 'package:job_seeker/features/video_resumes/widgets/saved_script_widget.dart';
import 'package:get/get.dart';

class SavedScriptList extends StatelessWidget {
  final VideoResumesController videoResumesController =
      Get.find<VideoResumesController>();

  SavedScriptList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ActionButton(
        width: MediaQuery.sizeOf(context).width * 0.85,
        buttonText: 'Generate Script',
        onPress: () {
          Get.toNamed(AppRoutes.generateScriptView);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: videoResumesController.savedScriptData.length,
          itemBuilder: (context, index) {
            return SavedScriptWidget(
              scriptNote:
                  videoResumesController.savedScriptData[index].scriptNote,
              title: videoResumesController.savedScriptData[index].title,
              onTap: () {},
              index: index,
              scriptTypes:
                  videoResumesController.savedScriptData[index].scriptTypes,
            );
          },
        ),
      ),
    );
  }
}
