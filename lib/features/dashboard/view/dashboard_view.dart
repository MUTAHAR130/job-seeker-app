import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:job_seeker/features/dashboard/data/services/shown_menu.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/dashboard/widgets/create_cover_letter_message.dart';
import 'package:job_seeker/features/dashboard/widgets/create_resume_message.dart';
import 'package:job_seeker/features/dashboard/widgets/resume_list.dart';

class DashboardView extends StatelessWidget {
  final ResumeController resumeController = Get.put(ResumeController());
  final HomeController homeController = Get.find<HomeController>();

  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 5),
              child: TabBar(
                splashFactory: NoSplash.splashFactory,
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
                  FutureBuilder(
                    future: ResumeListWidget(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!;
                      } else if (snapshot.hasError) {
                        debugPrint('${snapshot.error}');
                        return const Material(
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              "An Error Occurred",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  FutureBuilder(
                    future: LetterListWidget(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!;
                      } else if (snapshot.hasError) {
                        debugPrint('${snapshot.error}');
                        return const Material(
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              "An Error Occurred",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> ResumeListWidget() async {
    if (resumeController.initialR) {
      await resumeController.getResumes();
    }
    return GetBuilder(
      id: 'resumeList',
      init: resumeController,
      builder: (controller) {
        if (resumeController.shownResumeMenu == ShownMenu.hasData) {
          return ResumeList(
            itemCount: resumeController.resumeData.length,
            resumeData: resumeController.resumeData,
          );
        } else {
          return CreateResumeMessage();
        }
      },
    );
  }

  Future<Widget> LetterListWidget() async {
    if (resumeController.initialC) {
      await resumeController.getCoverLetters();
    }
    return GetBuilder(
      id: 'letterList',
      init: resumeController,
      builder: (controller) {
        if (resumeController.shownLetterMenu == ShownMenu.hasData) {
          return Container();
          // return ResumeList(
          //   itemCount: homeController.savedCoverLetterData.length,
          //   resumeData: homeController.savedCoverLetterData,
          // );
        } else {
          return CreateCoverLetterMessage();
        }
      },
    );
  }
}
