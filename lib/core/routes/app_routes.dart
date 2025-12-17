import 'package:get/get.dart';
import 'package:job_seeker/features/ai_interviews/view/ai_interviews_view.dart';
import 'package:job_seeker/features/ai_interviews/view/mock_interview_complete_view.dart';
import 'package:job_seeker/features/ai_interviews/view/mock_interview_view.dart';
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
import 'package:job_seeker/features/home/view/profile_view.dart';
import 'package:job_seeker/features/home/widgets/splash_screen.dart';
import 'package:job_seeker/features/job_search/view/job_detail_view.dart';
import 'package:job_seeker/features/job_search/view/job_filter_view.dart';
import 'package:job_seeker/features/job_search/view/job_search_view.dart';
import 'package:job_seeker/features/job_settings/view/job_settings_view.dart';
import 'package:job_seeker/features/messages/view/chats_view.dart';
import 'package:job_seeker/features/messages/view/message_view.dart';
import 'package:job_seeker/features/saved_filters/view/saved_filter_view.dart';
import 'package:job_seeker/features/video_resumes/view/generate_script_view.dart';
import 'package:job_seeker/features/video_resumes/view/record_video_view.dart';
import 'package:job_seeker/features/video_resumes/view/recording_video_view.dart';
import 'package:job_seeker/features/video_resumes/view/upload_video_view.dart';
import 'package:job_seeker/features/video_resumes/view/video_resumes_view.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  //auth
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';

  //home
  static const String home = '/home';
  static const String profileView = '/profileView';

  //dashboard
  static const String dashBoard = '/dashBoard';
  static const String resumeTemplate = '/resumeTemplate';
  static const String generateResume = '/generateResume';
  static const String generateCoverLetter = '/generateCoverLetter';
  static const String coverLetterSelectResume = '/coverLetterSelectResume';
  static const String resumeScoreView = '/resumeScoreView';

  //job search
  static const String jobSearchView = '/jobSearchView';
  static const String jobFilterView = '/jobFilterView';
  static const String jobDetailView = '/jobDetailView';

  //saved filters
  static const String savedFiltersView = '/savedFiltersView';

  //messages
  static const String messageView = '/messageView';
  static const String chatsView = '/chatsView';

  //job settings
  static const String jobSettingsView = '/jobSettingsView';

  //video resumes
  static const String videoResumeView = '/videoResumeView';
  static const String uploadVideoView = '/uploadVideoView';
  static const String recordVideView = '/recordVideoView';
  static const String recordingVideoView = '/recordingVideoView';
  static const String generateScriptView = '/generateScriptView';

  //ai interviews
  static const String aiInterviewView = '/aiInterviewView';
  static const String mocInterviewView = '/mockInterviewView';
  static const String mockInterviewCompleteView = '/mockInterviewCompleteVIew';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
    //auth
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(name: AppRoutes.forgotPassword, page: () => ForgotPasswordView()),
    //home
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    GetPage(name: AppRoutes.profileView, page: () => ProfileView()),
    //dashboard
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
    //job search
    GetPage(name: AppRoutes.jobSearchView, page: () => JobSearchView()),
    GetPage(name: AppRoutes.jobFilterView, page: () => JobFilterView()),
    GetPage(name: AppRoutes.jobDetailView, page: () => JobDetailView()),
    //saved filters
    GetPage(name: AppRoutes.savedFiltersView, page: () => SavedFiltersView()),
    //messages
    GetPage(name: AppRoutes.messageView, page: () => MessageView()),
    GetPage(name: AppRoutes.chatsView, page: () => ChatsView()),
    //job settings
    GetPage(name: AppRoutes.jobSettingsView, page: () => JobSettingsView()),
    //video resumes
    GetPage(name: AppRoutes.videoResumeView, page: () => VideoResumesView()),
    GetPage(name: AppRoutes.uploadVideoView, page: () => UploadVideoView()),
    GetPage(name: AppRoutes.recordVideView, page: () => RecordVideoView()),
    GetPage(
      name: AppRoutes.recordingVideoView,
      page: () => RecordingVideoView(),
    ),
    GetPage(
      name: AppRoutes.generateScriptView,
      page: () => GenerateScriptView(),
    ),
    //ai interviews
    GetPage(name: AppRoutes.aiInterviewView, page: () => AIInterviewsView()),
    GetPage(name: AppRoutes.mocInterviewView, page: () => MockInterviewView()),
    GetPage(
      name: AppRoutes.mockInterviewCompleteView,
      page: () => MockInterviewCompleteView(),
    ),
  ];
}
