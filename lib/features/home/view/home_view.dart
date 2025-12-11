import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/features/dashboard/controller/cover_letter_controller.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:job_seeker/features/dashboard/view/dashboard_view.dart';
import 'package:job_seeker/features/home/widgets/home_drawer.dart';
import 'package:job_seeker/features/job_search/view/job_search_view.dart';
import 'package:job_seeker/features/saved_filters/controller/saved_filters_controller.dart';
import 'package:job_seeker/features/saved_filters/view/saved_filter_view.dart';

class HomeView extends StatelessWidget {
  final ResumeController resumeController = Get.put(ResumeController());
  final HomeController homeController = Get.put(HomeController());
  final SavedFiltersController savedFiltersController = Get.put(
    SavedFiltersController(),
  );
  final CoverLetterController coverLetterController = Get.put(
    CoverLetterController(),
  );

  HomeView({super.key});

  final List<Widget> pageList = [
    DashboardView(),
    JobSearchView(),
    Center(child: Text('AI Interviews')),
    Center(child: Text('Video Resumes')),
    Center(child: Text('Messages')),
    SavedFiltersView(),
    Center(child: Text('job Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        actions: [
          ActionButton(
            width: 70,
            height: 32,
            buttonText: 'Upgrade',
            onPress: () {},
          ),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/temp.jpg'),
          ),
        ],
      ),
      body: Obx(() => pageList[homeController.selectedPageIndex.value]),
    );
  }
}
