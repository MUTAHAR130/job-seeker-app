import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/controller/cover_letter_controller.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:job_seeker/features/dashboard/view/dashboard_view.dart';
import 'package:job_seeker/features/home/widgets/home_drawer.dart';
import 'package:job_seeker/features/job_search/view/job_search_view.dart';

class HomeView extends StatelessWidget {
  final ResumeController resumeController = Get.put(ResumeController());
  final HomeController homeController = Get.put(HomeController());
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
    Center(child: Text('Saved Filters')),
    Center(child: Text('job Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(),
      body: Obx(() => pageList[homeController.selectedPageIndex.value]),
    );
  }
}
