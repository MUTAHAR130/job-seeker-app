import 'package:flutter/material.dart';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:job_seeker/features/home/models/user_model.dart';
import 'package:get/get.dart';

class ProfilePicture extends StatelessWidget {
  final String? pictureUrl;
  final String? name;
  final double radius;

  const ProfilePicture({
    super.key,
    required this.radius,
    this.pictureUrl,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    if (pictureUrl != null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(pictureUrl!),
      );
    } else {
      return Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: Get.theme.colorScheme.primary,
        ),
        child: Center(
          child: Text(
            '${name![0]}',
            style: TextStyle(color: Get.theme.colorScheme.onPrimary),
          ),
        ),
      );
    }
  }
}

// class ProfilePicture extends StatelessWidget {
//   final String profileLink;
//   final double? profileRadius;
//
//   const ProfilePicture({
//     super.key,
//     required this.profileLink,
//     this.profileRadius,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final profilePictureCache = CacheManager(
//       Config(
//         'profilePictureCache',
//         stalePeriod: const Duration(days: 30),
//         maxNrOfCacheObjects: 100,
//       ),
//     );
//     return CachedNetworkImage(
//       imageUrl: profileLink,
//       cacheManager: profilePictureCache,
//       imageBuilder: (context, imageProvider) =>
//           CircleAvatar(backgroundImage: imageProvider, radius: profileRadius),
//     );
//   }
// }

// placeholder: (context, url) => imageErrorWidget(profileRadius),
// errorWidget: (context, url, error) =>
//     imageErrorWidget(profileRadius));
