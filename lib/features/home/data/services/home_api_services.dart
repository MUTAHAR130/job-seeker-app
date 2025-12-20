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

  static Future updateProfile(data) async {
    try {
      return await _apiClient.patchApi('${AppUrl.userUrl}/profile', data);
      // return await _apiClient.patchApi('${AppUrl.userUrl}/profile', {
      //   "first_name": "Nehal",
      //   "last_name": "Mahdi",
      //   "phone_number": "1234567890",
      //   "gender": "MALE",
      //   "professional_summary": "",
      //   "job_search_status": "NOT_LOOKING",
      //   "availability_period": 0,
      //   "currency": "USD",
      //   "company_name": "",
      //   "company_size": "",
      //   "industry": ""
      // });
    } catch (e) {
      rethrow;
    }
  }

  static Future uploadAvatar(data) async {
    try {
      return await _apiClient.multiPartPostApi(
        '${AppUrl.userUrl}/upload-avatar',
        {'avatar': data},
      );
    } catch (e) {
      rethrow;
    }
  }
}
