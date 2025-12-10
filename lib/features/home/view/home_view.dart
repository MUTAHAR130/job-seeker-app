import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/home/controller/resume_controller.dart';
import 'package:job_seeker/features/home/widgets/create_cover_letter_message.dart';
import 'package:job_seeker/features/home/widgets/create_resume_message.dart';
import 'package:job_seeker/features/home/widgets/home_drawer.dart';
import 'package:job_seeker/features/home/widgets/saved_resume_list.dart';

class HomeView extends StatelessWidget {
  final ResumeController resumeController = Get.put(ResumeController());
  final HomeController homeController = Get.put(HomeController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: HomeDrawer(),
        appBar: AppBar(
          // actions: [],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 5),
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Get.theme.hintColor,
                dividerColor: Colors.transparent,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0),
                  insets: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.start,

                tabs: const [
                  Tab(text: "Resumes"),
                  Tab(text: "Cover Letter"),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Obx(() {
                    if (homeController.shownResumeMenu.value == 'resumeList') {
                      return SavedResumeList(
                        itemCount: homeController.savedResumeData.length,
                        savedResumeData: homeController.savedResumeData,
                      );
                    } else {
                      return CreateResumeMessage();
                    }
                  }),
                  Obx(() {
                    if (homeController.shownLetterMenu.value == 'letterList') {
                      return SavedResumeList(
                        itemCount: homeController.savedCoverLetterData.length,
                        savedResumeData: homeController.savedCoverLetterData,
                      );
                    } else {
                      return CreateCoverLetterMessage();
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
