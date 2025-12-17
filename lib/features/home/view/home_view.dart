import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/ai_interviews/controller/ai_interview_controller.dart';
import 'package:job_seeker/features/ai_interviews/view/ai_interviews_view.dart';
import 'package:job_seeker/features/dashboard/controller/cover_letter_controller.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/dashboard/controller/resume_controller.dart';
import 'package:job_seeker/features/dashboard/view/dashboard_view.dart';
import 'package:job_seeker/features/home/widgets/home_drawer.dart';
import 'package:job_seeker/features/job_search/view/job_search_view.dart';
import 'package:job_seeker/features/job_settings/controller/job_settings_controller.dart';
import 'package:job_seeker/features/job_settings/view/job_settings_view.dart';
import 'package:job_seeker/features/messages/controller/message_controller.dart';
import 'package:job_seeker/features/messages/view/message_view.dart';
import 'package:job_seeker/features/saved_filters/controller/saved_filters_controller.dart';
import 'package:job_seeker/features/saved_filters/view/saved_filter_view.dart';
import 'package:job_seeker/features/video_resumes/controller/video_resumes_controller.dart';
import 'package:job_seeker/features/video_resumes/view/video_resumes_view.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final ResumeController resumeController = Get.put(ResumeController());
  final SavedFiltersController savedFiltersController = Get.put(
    SavedFiltersController(),
  );
  final CoverLetterController coverLetterController = Get.put(
    CoverLetterController(),
  );
  final MessageController messageController = Get.put(MessageController());
  final JobSettingsController jobSettingsController = Get.put(
    JobSettingsController(),
  );
  final VideoResumesController videoResumesController = Get.put(
    VideoResumesController(),
  );
  final AIInterviewController aiInterviewController = Get.put(
    AIInterviewController(),
  );

  HomeView({super.key});

  final List<Widget> pageList = [
    DashboardView(),
    JobSearchView(),
    AIInterviewsView(),
    VideoResumesView(),
    MessageView(),
    SavedFiltersView(),
    JobSettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        actions: [
          SvgPicture.string(AppIcons.freePlanIcon, height: 28,),
          SizedBox(width: 10),
          ActionButton(
            width: 68,
            height: 32,
            buttonText: 'Upgrade',
            onPress: () {},
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: (){
              Get.toNamed(AppRoutes.profileView);
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/temp.jpg'),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(() => pageList[homeController.selectedPageIndex.value]),
    );
  }
}
