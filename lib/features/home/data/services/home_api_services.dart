import 'package:get/get.dart';
import 'package:job_seeker/core/common/app_url.dart';
import 'package:job_seeker/core/data/network/base_api_services.dart';
import 'package:job_seeker/core/data/network/network_api_services.dart';

class HomeApiServices {
  static final BaseApiServices _apiClient = NetworkApiServices();

  static Future getUser() async {
    try {
      return await _apiClient.getApi('${AppUrl.userUrl}/get-user');
    } catch (e) {
      rethrow;
    }
  }

  static Future getProfileDetail() async {
    try {
      return await _apiClient.getApi('${AppUrl.userUrl}/get-profile-details');
    } catch (e) {
      rethrow;
    }
  }

  static Future getProfile() async {
    try {
      return await _apiClient.getApi('${AppUrl.userUrl}/profile');
    } catch (e) {
      rethrow;
    }
  }

  static Future uploadAvatar(formData) async {
    try {
      return await _apiClient.postApi(
          '${AppUrl.userUrl}/upload-avatar', formData);
    } catch (e) {
      rethrow;
    }
  }
}
