import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/score_guage_secondary.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/models/resume_template_model.dart';

class ResumeTemplateWidget extends StatelessWidget {
  final ResumeTemplateModel data;
  final Function? onTap;

  const ResumeTemplateWidget({super.key, this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 328,
                width: double.infinity,
                child: Image.network(
                  data.thumbnailUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: data.category == 'PROFESSIONAL'
                    ? SvgPicture.string(AppIcons.proIcon)
                    : SvgPicture.string(AppIcons.freeIcon),
              ),
            ],
          ),
          Container(
            height: 64,
            width: double.infinity,
            color: Get.theme.colorScheme.surface,
            child: ListTile(
              leading: ScoreGaugeSecondary(score: data.popularityScore),
              title: Text(
                data.description ?? 'Basic',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '${data.popularityScore}% + ${data.atsTag == 'BASIC_ATS_READY' ? 'Basic ATS Ready' : 'ATS Optimized'}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
