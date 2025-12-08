import 'package:get/get.dart';
import 'package:job_seeker/features/auth/bindings/login_binding.dart';
import 'package:job_seeker/features/auth/view/login_view.dart';
import 'package:job_seeker/features/auth/view/forgot_password_view.dart';
import 'package:job_seeker/features/home/view/home_view.dart';

class AppRoutes {
  // --- Auth Feature ---
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';
  static const String home = '/home';
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
  ];
}
