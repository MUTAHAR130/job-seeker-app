import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/video_resumes/controller/video_player_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatelessWidget {
  final String url;

  const VideoPlayerView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    // Inject the ViewModel and manage its lifecycle with GetBuilder
    return GetBuilder<VideoPlayerViewController>(
      init: VideoPlayerViewController(url),
      // Initialize the controller with the URL
      tag: url,
      // Use the URL as a unique tag if multiple videos are on screen
      builder: (controller) {
        // 1. Initial Loading State
        if (!controller.isInitialized.value) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // 2. Initialized State (The View Logic)
        return AspectRatio(
          aspectRatio: controller.videoController.value.aspectRatio,
          child: GestureDetector(
            onTap: controller.togglePlayback, // Call the ViewModel action
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // The Video Player Surface
                VideoPlayer(controller.videoController),

                // The Thumbnail/First Frame Overlay (Reactive)
                Obx(
                  () => Visibility(
                    visible: controller.showThumbnail.value,
                    // The VideoPlayer automatically shows the static first frame.
                    // This overlay simply provides the play icon and darkens the view.
                    child: Container(
                      // color: Colors.black.withOpacity(0.1),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                  ),
                ),

                // Play/Pause Icon Overlay (Visible only when paused and not showing thumbnail)
                Obx(
                  () => Visibility(
                    visible:
                        !controller.showThumbnail.value &&
                        !controller.videoController.value.isPlaying,
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
