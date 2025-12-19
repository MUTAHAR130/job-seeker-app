import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:job_seeker/features/dashboard/data/services/dashboard_api_services.dart';
import 'package:job_seeker/features/dashboard/data/services/shown_menu.dart';
import 'package:job_seeker/features/dashboard/models/resume_model.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';

class ResumeController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();
  bool initialR = true;
  bool initialC = true;
  var shownResumeMenu = ShownMenu.hasData;
  var shownLetterMenu = ShownMenu.hasData;
  List<ResumeModel> resumeData = [];
  List coverLetterData = [];
  var selectedFile = Rxn<File>();
  String fileName = '';

  getCoverLetters() async {
    initialC = false;
    // var response = await DashboardApiServices.getCoverLetters();
    // debugPrint('$response');
    coverLetterData = [];
    // for (var letter in response['resumes']) {
    //   coverLetterData.add(ResumeModel.fromJson(letter));
    // }
    if (coverLetterData.isEmpty) {
      shownLetterMenu = ShownMenu.noData;
      update(['letterList']);
    }
  }

  getResumes() async {
    initialR = false;
    var response = await DashboardApiServices.getResumes();
    resumeData = [];
    for (var resume in response['resumes']) {
      resumeData.add(ResumeModel.fromJson(resume));
    }
    if (resumeData.isEmpty) {
      shownResumeMenu = ShownMenu.noData;
      update(['resumeList']);
    }
  }

  setResumeDefault(index) async {
    try {
      // await DashboardApiServices.setResumePrimary(resumeData[index].id);

      for (var resume in resumeData) {
        resume.isPrimary = false;
      }
      resumeData[index].isPrimary = true;
      update(['resumeList']);
    } catch (e) {
      debugPrint('error $e');
    }
  }

  // 5 MB in bytes
  final int _sizeLimit = 5 * 1024 * 1024;

  Future<void> uploadFile(String type) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result != null) {
        int fileSize = result.files.first.size;

        if (fileSize > _sizeLimit) {
          double sizeInMb = fileSize / (1024 * 1024);

          Get.snackbar(
            "File Too Large",
            "Maximum size is 5MB. Selected file is ${sizeInMb.toStringAsFixed(2)}MB.",
            snackPosition: SnackPosition.BOTTOM,
          );
          deleteSpecificFile(File(result.files.single.path!));
          return;
        }

        if (result.files.single.path != null) {
          selectedFile.value = File(result.files.single.path!);
          fileName = result.files.single.name;

          final pdfMultipart = await http.MultipartFile.fromPath(
            type == 'resume' ? 'file' : 'coverLetter',
            selectedFile.value!.path,
            filename: fileName,
            contentType: http.MediaType('application', 'pdf'),
          );
          if(type =='resume'){
            var response = await DashboardApiServices.uploadResume(
              homeController.currentUser.id,
              pdfMultipart,
            );
            debugPrint('$response');
            //when success
            // getResumes();
            // update(['resumeList']);
          } else {
            var response = await DashboardApiServices.uploadResume(
              homeController.currentUser.id,
              pdfMultipart,
            );
            debugPrint('$response');
            //when success
            // getCoverLetters();
            // update(['letterList']);
          }
          deleteSpecificFile(selectedFile.value!);
          selectedFile.value = null;
        }
      }
    } catch (e) {
      debugPrint("An unexpected error occurred: $e");
      deleteSpecificFile(selectedFile.value!);
      // Get.snackbar("Error", "An unexpected error occurred: $e");
    }
  }

  Future<void> deleteSpecificFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
        print("Specific temporary file deleted.");
      }
    } catch (e) {
      rethrow;
    }
  }
}
