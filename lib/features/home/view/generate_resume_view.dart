import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/form_button.dart';
import 'package:job_seeker/features/home/widgets/prof_sum_tab.dart';
import 'package:job_seeker/features/home/widgets/basic_info_tab.dart';
import 'package:job_seeker/features/home/widgets/final_preview_tab.dart';

class GenerateResumeView extends StatelessWidget {
  const GenerateResumeView({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Resume',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.string(AppIcons.editIcon),
                      ),
                    ],
                  ),

                  FormButton(
                    buttonText: 'Download PDF',
                    onPress: () {},
                    bheight: 32,
                    bwidth: 100,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 5),
              child: TabBar(
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
              child: TabBarView(
                children: [
                  BasicInfoTab(),
                  ProfSumTab(),
                  const Center(child: Text('Work Exp')),
                  const Center(child: Text('Education')),
                  const Center(child: Text('Certifications')),
                  const Center(child: Text('Awards')),
                  const Center(child: Text('Skills')),
                  const Center(child: Text('Languages')),
                  FinalPreviewTab()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
