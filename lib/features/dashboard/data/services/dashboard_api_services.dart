import 'package:job_seeker/core/common/app_url.dart';
import 'package:job_seeker/core/data/network/base_api_services.dart';
import 'package:job_seeker/core/data/network/network_api_services.dart';
import 'package:job_seeker/features/dashboard/models/job_data_model.dart';
import 'package:job_seeker/features/home/models/profile_details_model.dart';

class DashboardApiServices {
  static final BaseApiServices _apiClient = NetworkApiServices();

  static Future getResumes() async {
    try {
      return await _apiClient.getApi('${AppUrl.resumeTemplateUrl}/get-resumes');
    } catch (e) {
      rethrow;
    }
  }

  static Future getResumeTemplates() async {
    try {
      return await _apiClient.getApi('${AppUrl.resumeTemplateUrl}/');
    } catch (e) {
      rethrow;
    }
  }

  static Future generateResume(
    String templateId,
    title,
    ProfileDetailsModel profileDetails,
    JobDataModel? jobData,
    jobId,
  ) async {
    try {
      return await _apiClient
          .postApi('${AppUrl.resumeTemplateUrl}/generate-resume/$templateId', {
            "resume_id": "",
            "resume_title": title,
            "profile_details": profileDetails.toJson(),
            "job_specific_data": jobData != null ? jobData.toJson() : {},
            "jobId": jobId,
          });
    } catch (e) {
      rethrow;
    }
  }

  static Future setResumePrimary(String resumeId) async {
    try {
      return await _apiClient.patchApi(
        '${AppUrl.resumeTemplateUrl}/set-primary/$resumeId',
        {},
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future resumeATSReport(data) async {
    try {
      return await _apiClient.multiPartPostApi(
        '${AppUrl.resumeTemplateUrl}/ats-report',
        {'resume_pdf_file': data},
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future uploadResume(String id, data) async {
    try {
      return await _apiClient.multiPartPostApi(
        '${AppUrl.resumeTemplateUrl}/upload-resume',
        {'file': data, 'job_seeker_id': id},
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteResume(String resumeId) async {
    try {
      return await _apiClient.getApi(
        '${AppUrl.resumeTemplateUrl}/del-resume/$resumeId',
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future ForceDeleteResume(String resumeId) async {
    try {
      return await _apiClient.deleteApi(
        '${AppUrl.resumeTemplateUrl}/force-delete-resume/$resumeId',
        {},
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future unlinkResume(String resumeId) async {
    try {
      return await _apiClient.patchApi(
        '${AppUrl.resumeTemplateUrl}/unlink-resume/$resumeId',
        {},
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future getCoverLetters() async {
    try {
      return await _apiClient.getApi(
        '${AppUrl.resumeTemplateUrl}/get-cover-letters',
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future uploadCoverLetters(data) async {
    try {
      return await _apiClient.multiPartPostApi(
        '${AppUrl.apiUrl}/cover-letters/upload-cover-letter',
        {'coverLetter': data},
      );
    } catch (e) {
      rethrow;
    }
  }
}
