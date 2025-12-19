import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/features/dashboard/widgets/three_dot_popup_menu.dart';
import 'package:job_seeker/features/video_resumes/widgets/video_thumbnail_widget.dart';
import 'package:get/get.dart';

class SavedVideoWidget extends StatelessWidget {
  final bool? isDefault;
  final bool? isRecorded;
  final String asset;
  final String title;
  final DateTime date;
  final Function onTap;
  final int index;

  const SavedVideoWidget({
    super.key,
    this.isDefault,
    required this.asset,
    required this.title,
    required this.onTap,
    required this.index,
    this.isRecorded,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            VideoThumbnailWidget(
              videoUrl: asset,
              height: 328,
              width: double.infinity,
            ),
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  onTap();
                },
                behavior: HitTestBehavior.opaque,
                child: Container(color: Colors.transparent),
              ),
            ),
            isDefault == true
                ? Positioned(
                    top: 5,
                    right: 5,
                    child: SvgPicture.string(AppIcons.defaultIcon),
                  )
                : SizedBox(),
          ],
        ),
        Container(
          height: 72,
          width: double.infinity,
          color: Get.theme.colorScheme.surface,
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            subtitle: Row(
              children: [
                Text(
                  isRecorded == true ? 'Recorded' : 'Uploaded',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.circle,
                  color: Get.theme.colorScheme.outline,
                  size: 4,
                ),
                Text(
                  DateFormat('MMM dd yyyy').format(date),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            trailing: ThreeDotPopupMenu(index: index, currentTitle: title),
          ),
        ),
      ],
    );
  }
}
