import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';

class ResumeDetailTile extends StatelessWidget {
  final String titleText;
  final String? subTitleText;
  final VoidCallback? onTapDelete;

  const ResumeDetailTile({
    super.key,
    required this.titleText,
    this.subTitleText,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    // const Color borderColor = Color(0xFFC7B199);
    // const Color primaryTextColor = Color(
    //   0xFF3B464A,
    // );
    // const Color secondaryTextColor = Color(0xFF626D6F);

    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10.0),
        // border: Border.all(color: Get.theme.colorScheme.tertiary, width: 1.5), // border when selected
      ),
      child: ListTile(
        titleAlignment: subTitleText == null
            ? ListTileTitleAlignment.center
            : ListTileTitleAlignment.top,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        title: Padding(
          padding: EdgeInsets.only(bottom: subTitleText == null ? 0 : 8),
          child: Text(
            titleText,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: subTitleText != null
            ? Text(
                subTitleText!,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              )
            : null,
        trailing: InkWell(
          onTap: onTapDelete,
          child: SvgPicture.string(AppIcons.deleteIcon),
        ),
      ),
    );
  }
}
