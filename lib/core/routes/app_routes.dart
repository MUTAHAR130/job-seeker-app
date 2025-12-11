import 'package:get/get.dart';
import 'package:job_seeker/features/auth/bindings/login_binding.dart';
import 'package:job_seeker/features/auth/view/login_view.dart';
import 'package:job_seeker/features/auth/view/forgot_password_view.dart';
import 'package:job_seeker/features/dashboard/view/cover_letter_select_resume_view.dart';
import 'package:job_seeker/features/dashboard/view/dashboard_view.dart';
import 'package:job_seeker/features/dashboard/view/generate_cover_letter_view.dart';
import 'package:job_seeker/features/dashboard/view/generate_resume_view.dart';
import 'package:job_seeker/features/home/view/home_view.dart';
import 'package:job_seeker/features/dashboard/view/resume_score_view.dart';
import 'package:job_seeker/features/dashboard/view/resume_template_view.dart';
import 'package:job_seeker/features/job_search/view/job_detail_view.dart';
import 'package:job_seeker/features/job_search/view/job_filter_view.dart';
import 'package:job_seeker/features/job_search/view/job_search_view.dart';
import 'package:job_seeker/features/saved_filters/view/saved_filter_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';
  static const String home = '/home';
  static const String dashBoard = '/dashBoard';
  static const String resumeTemplate = '/resumeTemplate';
  static const String generateResume = '/generateResume';
  static const String generateCoverLetter = '/generateCoverLetter';
  static const String coverLetterSelectResume = '/coverLetterSelectResume';
  static const String resumeScoreView = '/resumeScoreView';
  static const String jobSearchView = '/jobSearchView';
  static const String jobFilterView = '/jobFilterView';
  static const String jobDetailView = '/jobDetailView';
  static const String savedFiltersView = '/savedFiltersView';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(name: AppRoutes.forgotPassword, page: () => ForgotPasswordView()),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    GetPage(name: AppRoutes.dashBoard, page: () => DashboardView()),
    GetPage(name: AppRoutes.resumeTemplate, page: () => ResumeTemplateView()),
    GetPage(name: AppRoutes.generateResume, page: () => GenerateResumeView()),
    GetPage(
      name: AppRoutes.generateCoverLetter,
      page: () => GenerateCoverLetterView(),
    ),
    GetPage(
      name: AppRoutes.coverLetterSelectResume,
      page: () => CoverLetterSelectResumeView(),
    ),
    GetPage(name: AppRoutes.resumeScoreView, page: () => ResumeScoreView()),
    GetPage(name: AppRoutes.jobSearchView, page: () => JobSearchView()),
    GetPage(name: AppRoutes.jobFilterView, page: () => JobFilterView()),
    GetPage(name: AppRoutes.jobDetailView, page: () => JobDetailView()),
    GetPage(name: AppRoutes.savedFiltersView, page: () => SavedFiltersView()),
  ];
}
