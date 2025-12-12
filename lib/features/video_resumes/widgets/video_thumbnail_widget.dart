import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailWidget extends StatelessWidget {
  final String videoUrl;
  final double height;
  final double width;

  const VideoThumbnailWidget({
    super.key,
    required this.videoUrl,
    this.height = 200,
    this.width = double.infinity,
  });

  // Function to generate the thumbnail data
  Future<Uint8List?> _generateThumbnail() async {
    return await VideoThumbnail.thumbnailData(
      video: videoUrl,
      imageFormat: ImageFormat.JPEG,
      // Optional: Specify quality, width, and time position (e.g., at 0 seconds)
      quality: 75,
      timeMs: 0,
      maxHeight: height.toInt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _generateThumbnail(),
      builder: (context, snapshot) {
        // 1. Loading State
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: height,
            width: width,
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }

        // 2. Error or No Data State
        if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
          return SizedBox(
            height: height,
            width: width,
            child: const Center(child: Icon(Icons.broken_image)),
          );
        }

        // 3. Success State: Display the thumbnail
        return Stack(
          alignment: Alignment.center,
          children: [
            Image.memory(
              snapshot.data!,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            // Optional: A large play button overlay
            const Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 60,
            ),
          ],
        );
      },
    );
  }
}