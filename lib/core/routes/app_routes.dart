import 'package:get/get.dart';
import 'package:job_seeker/features/auth/bindings/login_binding.dart';
import 'package:job_seeker/features/auth/view/login_view.dart';
import 'package:job_seeker/features/auth/view/forgot_password_view.dart';
import 'package:job_seeker/features/home/view/cover_letter_select_resume_view.dart';
import 'package:job_seeker/features/home/view/generate_cover_letter_view.dart';
import 'package:job_seeker/features/home/view/generate_resume_view.dart';
import 'package:job_seeker/features/home/view/home_view.dart';
import 'package:job_seeker/features/home/view/resume_score_view.dart';
import 'package:job_seeker/features/home/view/resume_template_view.dart';
import 'package:job_seeker/features/job/view/job_search_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';
  static const String home = '/home';
  static const String resumeTemplate = '/resumeTemplate';
  static const String generateResume = '/generateResume';
  static const String generateCoverLetter = '/generateCoverLetter';
  static const String coverLetterSelectResume = '/coverLetterSelectResume';
  static const String resumeScoreView = '/resumeScoreView';
  static const String jobSearchView = '/jobSearchView';
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
  ];
}
