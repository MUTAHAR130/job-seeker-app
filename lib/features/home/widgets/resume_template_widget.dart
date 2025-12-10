import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart';

class ResumeTemplateWidget extends StatelessWidget {
  final String typeIcon;
  final String resumeAsset;
  final String typeTile;
  final String typeProperties;
  final String scoreIcon;
  final Function? onTap;

  const ResumeTemplateWidget({
    super.key,
    required this.typeIcon,
    required this.resumeAsset,
    required this.scoreIcon,
    required this.typeProperties,
    required this.typeTile,
    this.onTap
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
                onTap: (){onTap!();},
                behavior: HitTestBehavior.opaque,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(top: 5, right: 5, child: SvgPicture.string(typeIcon)),
          ],
        ),
        Container(
          height: 64,
          width: double.infinity,
          color: Get.theme.colorScheme.surface,
          child: ListTile(
            leading: SvgPicture.string(scoreIcon),
            title: Text(
              typeTile,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              typeProperties,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
