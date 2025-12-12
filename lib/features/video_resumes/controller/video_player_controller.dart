import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerViewController extends GetxController {
  final String videoUrl;

  // The VideoPlayerController itself
  late VideoPlayerController videoController;

  // Reactive state to track if the controller is initialized
  var isInitialized = false.obs;

  // Reactive state to control the visibility of the static thumbnail
  var showThumbnail = true.obs;

  VideoPlayerViewController(this.videoUrl);

  @override
  void onInit() {
    super.onInit();

    // Initialize the VideoPlayerController
    videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        // Update the reactive state when initialized
        isInitialized.value = true;
      })
    // Listen for playback state changes (optional but good practice)
      ..addListener(_updatePlaybackState);
  }

  void _updatePlaybackState() {
    // Force a UI update when playback state changes (e.g., buffering/finished)
    // This allows the Obx in the View to react to isPlaying changes.
    update();
  }

  @override
  void onClose() {
    // Dispose the controller when the widget is removed from the screen
    videoController.dispose();
    super.onClose();
  }

  void togglePlayback() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      // Hide the static thumbnail and start playback
      showThumbnail.value = false;
      videoController.play();
    }
    // Manually trigger update to rebuild the play/pause icon
    update();
  }
}