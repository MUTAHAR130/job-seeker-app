import 'package:job_seeker/core/common/app_url.dart';
import 'package:job_seeker/core/data/network/base_api_services.dart';
import 'package:job_seeker/core/data/network/network_api_services.dart';

class AuthApiService {
  static final BaseApiServices _apiClient = NetworkApiServices();

  static Future devLoginWithEmail(String email) async {
    try {
      return await _apiClient.postApi('${AppUrl.apiUrl}/oauth/dev-login', {
        'email': email,
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future loginWithEmail(String email, String password) async {
    try {
      return await _apiClient.postApi('${AppUrl.loginUrl}/login-with-email', {
        'email': email,
        'password': password,
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future loginWithGoogle(String credential) async {
    try {
      return await _apiClient.postApi('${AppUrl.loginUrl}/login-with-google', {
        'code': credential,
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future sendVerificationEmail(String email) async {
    try {
      return await _apiClient.postApi(
        '${AppUrl.userUrl}/send-verification-email',
        {'email': email},
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future verifyEmail(String token) async {
    try {
      return await _apiClient.postApi('${AppUrl.userUrl}/verify-email', {
        'email': token,
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future resetPassRequest(String email) async {
    try {
      return await _apiClient.postApi('${AppUrl.userUrl}/reset-password', {
        'email': email,
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future changePass(String currentPass, String newPass) async {
    try {
      return await _apiClient.postApi('${AppUrl.userUrl}/change-password', {
        "currentPassword": currentPass,
        "newPassword": newPass,
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future signInWithEmail(
    String email,
    String password,
    String confirmPass,
    String fullName,
    String userType,
  ) {
    try {
      return _apiClient.postApi('${AppUrl.apiUrl}/signup/signup-with-email', {
        'email': email,
        'password': password,
        'confirm_password': confirmPass,
        "fullname": fullName,
        "user_type": userType,
      });
    } catch (e) {
      rethrow;
    }
  }
}
