import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailWidget extends StatelessWidget {
  final String videoUrl;
  final double height;
  final double width;

  const VideoThumbnailWidget({
    super.key,
    required this.videoUrl,
    this.height = 284,
    this.width = double.infinity,
  });

  // Function to generate the thumbnail data
  Future<String?> _generateThumbnail() async {
    // Use the path as defined in pubspec.yaml
    final videoAssetPath = videoUrl;

    // For assets, we usually need to copy the asset to a temporary file path
    // that the native Android/iOS MediaMetadataRetriever can read directly.

    final byteData = await rootBundle.load(videoAssetPath);
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/temp_video.mp4';
    final file = File(tempPath);

    await file.writeAsBytes(byteData.buffer.asUint8List());

    // Now generate the thumbnail using the temporary file path
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: tempPath,
      // Use the real file path
      thumbnailPath: '${tempDir.path}/video_thumb.png',
      imageFormat: ImageFormat.PNG, // PNG uses lossless compression
      maxWidth: 600, // <--- Set a sufficient width (e.g., 600 pixels)
      quality: 100, // <--- Set quality to maximum
    );

    // Clean up the temporary video file if needed
    await file.delete();

    return thumbnailPath;

    // return await VideoThumbnail.thumbnailData(
    //   video: videoUrl,
    //   imageFormat: ImageFormat.JPEG,
    //   // Optional: Specify quality, width, and time position (e.g., at 0 seconds)
    //   quality: 75,
    //   timeMs: 0,
    //   maxHeight: height.toInt(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _generateThumbnail(),
      builder: (context, snapshot) {
        // 1. Loading State
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: height,
            width: width,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        // 2. Error or No Data State
        if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
          debugPrint('error loading thumbnail ${snapshot.error}');
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
            Image.file(
              File(snapshot.data!),
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            // Image.memory(
            //   snapshot.data!,
            //   height: height,
            //   width: width,
            //   fit: BoxFit.cover,
            // ),
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
