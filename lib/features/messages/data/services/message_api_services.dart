import 'package:job_seeker/core/common/app_url.dart';
import 'package:job_seeker/core/data/network/base_api_services.dart';
import 'package:job_seeker/core/data/network/network_api_services.dart';

class MessageApiServices {
  static final BaseApiServices _apiClient = NetworkApiServices();

  static Future getThreads() async {
    try {
      return await _apiClient.getApi('${AppUrl.threadUrl}');
    } catch (e) {
      rethrow;
    }
  }

  static Future createThread(
    String name,
    List<String> participants,
    String type,
  ) async {
    try {
      return await _apiClient.postApi('${AppUrl.threadUrl}', {
        "name": name,
        "participantIds": participants,
        "type": type,
      });
    } catch (e) {
      rethrow;
    }
  }

  static Future getMessages(threadId) async {
    try {
      return await _apiClient.getApi('${AppUrl.threadUrl}/$threadId/messages');
    } catch (e) {
      rethrow;
    }
  }

  static Future sendMessage(
    String threadId,
    String message,
    List<String> attachmentIds,
  ) async {
    try {
      return await _apiClient.postApi(
        '${AppUrl.threadUrl}/$threadId/messages',
        {"content": message, "attachmentIds": attachmentIds},
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future uploadAttachment(threadId, file) async {
    try {
      return await _apiClient.multiPartPostApi(
        '${AppUrl.threadUrl}/$threadId/messages',
        {"file": file},
      );
    } catch (e) {
      rethrow;
    }
  }
}
