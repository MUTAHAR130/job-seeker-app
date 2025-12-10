import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/home/models/drawer_option_model.dart';
import 'package:job_seeker/features/home/models/saved_resume_model.dart';

class HomeController extends GetxController {
  List<DrawerOptionModel> drawerOptions = [
    DrawerOptionModel(
      title: 'Dashboard',
      drawerIcon: AppIcons.dashboardIcon,
      selected: true,
      pageRoute: AppRoutes.home,
    ),
    DrawerOptionModel(
      title: 'Job Search',
      drawerIcon: AppIcons.searchIcon,
      selected: false,
      pageRoute: AppRoutes.jobSearchView,
    ),
    DrawerOptionModel(
      title: 'AI Interviews',
      drawerIcon: AppIcons.aiHelpIcon,
      selected: false,
      pageRoute: '',
    ),
    DrawerOptionModel(
      title: 'Video Resumes',
      drawerIcon: AppIcons.videoResumeIcon,
      selected: false,
      pageRoute: '',
    ),
    DrawerOptionModel(
      title: 'Messages',
      drawerIcon: AppIcons.messagesIcon,
      selected: false,
      pageRoute: '',
    ),
    DrawerOptionModel(
      title: 'Saved Filters',
      drawerIcon: AppIcons.savedFilterIcon,
      selected: false,
      pageRoute: '',
    ),
    DrawerOptionModel(
      title: 'Job Settings',
      drawerIcon: AppIcons.jobSettingsIcon,
      selected: false,
      pageRoute: '',
    ),
  ];

  List<SavedResumeModel> savedResumeData = [
    SavedResumeModel(
      resumeTitle: 'Resume 1',
      resumeAsset: 'assets/docs/Resume1.pdf',
      isDefault: true,
    ),
    SavedResumeModel(
      resumeTitle: 'Resume 2',
      resumeAsset: 'assets/docs/Resume1.pdf',
    ),
  ];

  List<SavedResumeModel> savedCoverLetterData = [
    SavedResumeModel(
      resumeTitle: 'Cover Letter 1',
      resumeAsset: 'assets/docs/Resume1.pdf',
      isDefault: true,
    ),
    SavedResumeModel(
      resumeTitle: 'Cover Letter 2',
      resumeAsset: 'assets/docs/Resume1.pdf',
    ),
  ];

  Rx<String> shownResumeMenu = 'createResume'.obs;
  Rx<String> shownLetterMenu = 'createLetter'.obs;

  changeMenu(String value) {
    shownResumeMenu.value = value;
  }
}
