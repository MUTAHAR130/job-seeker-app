import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:job_seeker/features/video_resumes/controller/camera_controller.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the controller
    final CameraRecordingController cameraRecordingController = Get.put(CameraRecordingController());

    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 1. Camera Preview Widget
          Obx(() {
            if (!cameraRecordingController.isInitialized.value) {
              return const Center(child: CircularProgressIndicator(color: Colors.white));
            }

            // Ensure the preview fills the screen while maintaining aspect ratio
            return SizedBox(
              width: Get.width,
              height: Get.height,
              child: CameraPreview(cameraRecordingController.cameraController.value!),
            );
          }),

          // 2. Recording Status Indicator
          Obx(() => Positioned(
            top: 50,
            child: cameraRecordingController.isRecording.value
                ? Row(
              children: [
                const Icon(Icons.fiber_manual_record, color: Colors.red),
                const SizedBox(width: 8),
                Text('RECORDING', style: TextStyle(color: Colors.red.shade400, fontSize: 16)),
              ],
            )
                : const SizedBox.shrink(),
          )),

          // 3. Control Button (Start/Stop)
          Positioned(
            bottom: 40,
            child: Obx(() {
              if (!cameraRecordingController.isInitialized.value) {
                return const SizedBox.shrink();
              }

              return GestureDetector(
                onTap: () {
                  if (cameraRecordingController.isRecording.value) {
                    cameraRecordingController.stopVideoRecording();
                  } else {
                    cameraRecordingController.startVideoRecording();
                  }
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cameraRecordingController.isRecording.value ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}