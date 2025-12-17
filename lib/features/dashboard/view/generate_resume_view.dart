import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:job_seeker/features/dashboard/widgets/tabs/award_tab.dart';
import 'package:job_seeker/features/dashboard/widgets/tabs/certification_tab.dart';
import 'package:job_seeker/features/dashboard/widgets/tabs/education_tab.dart';
import 'package:job_seeker/features/dashboard/widgets/tabs/language_tab.dart';
import 'package:job_seeker/features/dashboard/widgets/tabs/prof_sum_tab.dart';
import 'package:job_seeker/features/dashboard/widgets/tabs/basic_info_tab.dart';
import 'package:job_seeker/features/dashboard/widgets/tabs/final_preview_tab.dart';
import 'package:job_seeker/features/dashboard/widgets/tabs/skills_tab.dart';
import 'package:job_seeker/features/dashboard/widgets/tabs/work_exp_tab.dart';

class GenerateResumeView extends StatelessWidget {
  final ResumeController resumeController = Get.find<ResumeController>();

  GenerateResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      resumeController.changeTitle();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            resumeController.resumeTitle.value,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        SvgPicture.string(AppIcons.editIcon),
                      ],
                    ),
                  ),

                  ActionButton(
                    buttonText: 'Download PDF',
                    onPress: () {},
                    height: 32,
                    width: 100,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 5),
              child: TabBar(
                splashFactory: NoSplash.splashFactory,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Get.theme.hintColor,
                dividerColor: Colors.transparent,
                indicatorColor: Get.theme.colorScheme.surface,
                indicator: BoxDecoration(
                  color: Get.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                tabAlignment: TabAlignment.start,

                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "Basic Info"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "Prof Sum"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "Work Exp"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "Education"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "Certifications"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "Awards"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "Skills"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "Languages"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "Final Preview"),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TabBarView(
                  children: [
                    BasicInfoTab(),
                    ProfSumTab(),
                    WorkExpTab(),
                    EducationTab(),
                    CertificationTab(),
                    AwardTab(),
                    SkillsTab(),
                    LanguageTab(),
                    FinalPreviewTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
