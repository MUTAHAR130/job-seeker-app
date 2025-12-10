import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/home/controller/resume_controller.dart';
import 'package:job_seeker/features/home/widgets/fixing_issues_popup.dart';
import 'package:job_seeker/features/home/widgets/scored_category_tile.dart';

class ResumeScoreView extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  ResumeScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore My Resume Score',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              Text(
                'Resume Score',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 130,
                          width: 212,
                          child: Image.asset('assets/images/score_frame.png'),
                        ),
                        Positioned(
                          top: 40,
                          left: 50,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '70%',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Needs Improvement',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ScoredCategoryTile(
                title: 'Structure & Formatting',
                score: 25,
                isSelected: true,
              ),
              SizedBox(height: 15),
              ScoredCategoryTile(
                title: 'Keyword Matching',
                score: 50,
                isSelected: false,
              ),
              SizedBox(height: 15),
              ScoredCategoryTile(
                title: 'Section Completeness',
                score: 75,
                isSelected: false,
              ),
              SizedBox(height: 15),
              ScoredCategoryTile(
                title: 'Skill Alignment',
                score: 100,
                isSelected: false,
              ),
              ListView.builder(
                itemCount: resumeController.structureFormatingCats.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.top,
                    leading: SvgPicture.string(
                      resumeController.structureFormatingCats[index].statusIcon,
                    ),
                    title: Text(
                      resumeController.structureFormatingCats[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      resumeController.structureFormatingCats[index].subTitle,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButton(
                    bwidth: 150,
                    invertedColor: true,
                    hPadding: 0,
                    buttonText: 'Regenerate with AI',
                    onPress: () {},
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF375668), Color(0xFF40C94E)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: ActionButton(
                      bwidth: 150,
                      hPadding: 0,
                      noColor: true,
                      noBorder: true,
                      prefixIcon: AppIcons.aiSparkIcon,
                      buttonText: 'Fix Issues with AI',
                      onPress: () {Get.dialog(FixingIssuesPopup());},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
