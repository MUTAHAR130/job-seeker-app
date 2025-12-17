import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CameraRecordingController extends GetxController {
  // Observables for camera state
  Rx<CameraController?> cameraController = Rx<CameraController?>(null);
  RxBool isInitialized = false.obs;
  RxBool isRecording = false.obs;

  // Stores the temporary file path after recording
  Rx<XFile?> recordedVideoFile = Rx<XFile?>(null);

  // 1. Initialize the camera
  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      // Get a list of available cameras
      final cameras = await availableCameras();

      // Select the rear camera (or the first one)
      final CameraDescription selectedCamera = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );
      // final CameraDescription selectedCamera = cameras.first;

      // Create and initialize the controller
      cameraController.value = CameraController(
        selectedCamera,
        ResolutionPreset.medium, // Adjust resolution as needed
        enableAudio: true,
      );

      await cameraController.value!.initialize();
      isInitialized.value = true;
    } catch (e) {
      Get.snackbar("Error", "Camera initialization failed: $e", snackPosition: SnackPosition.BOTTOM);
      isInitialized.value = false;
    }
  }

  // 2. Start recording to a temporary file
  Future<void> startVideoRecording() async {
    if (cameraController.value == null || !cameraController.value!.value.isInitialized) {
      return;
    }
    if (cameraController.value!.value.isRecordingVideo) {
      return;
    }

    try {
      // Start recording
      await cameraController.value!.startVideoRecording();
      isRecording.value = true;
    } catch (e) {
      Get.snackbar("Error", "Failed to start recording: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  // 3. Stop recording and save the file temporarily
  Future<void> stopVideoRecording() async {
    if (!cameraController.value!.value.isRecordingVideo) {
      return;
    }

    try {
      // Stop recording and get the temporary XFile
      final XFile file = await cameraController.value!.stopVideoRecording();

      // Store the file object in the observable for immediate access/processing
      recordedVideoFile.value = file;

      isRecording.value = false;

      Get.snackbar(
        "Recording Stopped",
        "File saved temporarily in memory: ${file.path}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
      );

      // Example of how to access the file for processing:
      // await processVideo(recordedVideoFile.value!.path);

    } on CameraException catch (e) {
      Get.snackbar("Error", "Failed to stop recording: $e", snackPosition: SnackPosition.BOTTOM);
      isRecording.value = false;
    }
  }

  // 4. Dispose the camera controller when the widget is closed
  @override
  void onClose() {
    cameraController.value?.dispose();
    super.onClose();
  }
}