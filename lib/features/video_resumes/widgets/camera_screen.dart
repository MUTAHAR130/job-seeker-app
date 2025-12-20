import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/features/video_resumes/controller/camera_controller.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the controller
    final CameraRecordingController cameraRecordingController = Get.put(
      CameraRecordingController(),
    );

    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 1. Camera Preview Widget
          Obx(() {
            if (!cameraRecordingController.isInitialized.value) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            // Ensure the preview fills the screen while maintaining aspect ratio
            return SizedBox(
              width: Get.width,
              height: Get.height,
              child: CameraPreview(
                cameraRecordingController.cameraController.value!,
              ),
            );
          }),

          // 2. Control Button (Start/Stop)
          Positioned(
            right: 5,
            bottom: 5,
            child: Obx(() {
              if (!cameraRecordingController.isInitialized.value) {
                return const SizedBox.shrink();
              }

              return ActionButton(
                bgColor: Colors.red,
                prefixIcon: AppIcons.whiteDotIcon,
                width: cameraRecordingController.isRecording.value ? 70 : 140,
                buttonText: cameraRecordingController.isRecording.value ? 'Stop' : 'Start Recording',
                onPress: () {
                  if (cameraRecordingController.isRecording.value) {
                    cameraRecordingController.isRecording.value = false;
                    // cameraRecordingController.stopVideoRecording();
                  } else {
                    cameraRecordingController.isRecording.value = true;
                    // cameraRecordingController.startVideoRecording();
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
