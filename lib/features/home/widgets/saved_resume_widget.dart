import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/features/home/widgets/three_dot_popup_menu.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart';

class SavedResumeWidget extends StatelessWidget {
  final bool? isDefault;
  final String resumeAsset;
  final String resumeTitle;
  final Function onTap;
  final bool? isRadio;
  final int? groupVal;
  final int index;

  const SavedResumeWidget({
    super.key,
    this.isDefault,
    required this.resumeAsset,
    required this.resumeTitle,
    required this.onTap,
    required this.index,
    this.isRadio,
    this.groupVal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 328,
              width: double.infinity,
              child: SfPdfViewer.asset(resumeAsset),
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
          height: 48,
          width: double.infinity,
          color: Get.theme.colorScheme.surface,
          child: ListTile(
            title: Text(
              resumeTitle,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            trailing: isRadio == true
                ? Radio(value: index, groupValue: groupVal, onChanged: (val) {})
                : ThreeDotPopupMenu(index: index),
          ),
        ),
      ],
    );
  }
}
