import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/widgets/edit_resume_title.dart';

class HomeController extends GetxController{
  TextEditingController resumeTitleTC = TextEditingController();
  //basic info
  TextEditingController nameFieldTC = TextEditingController();
  TextEditingController emailFieldTC = TextEditingController();
  //prof sum
  TextEditingController profSumTC = TextEditingController();
  //work detail
  TextEditingController jobTitleTC = TextEditingController();
  TextEditingController jobCompanyTC = TextEditingController();
  TextEditingController workDescTC = TextEditingController();
  //edu detail
  TextEditingController degreeTitleTC = TextEditingController();
  TextEditingController instituteTC = TextEditingController();
  TextEditingController eduDescTC = TextEditingController();
  //cert detail
  TextEditingController certNameTC = TextEditingController();
  TextEditingController certOrganizationTC = TextEditingController();
  TextEditingController certDescTC = TextEditingController();
  //award detail
  TextEditingController awardNameTC = TextEditingController();
  TextEditingController awardOrganizationTC = TextEditingController();
  TextEditingController awardDescTC = TextEditingController();
  //skill detail
  TextEditingController skillTC = TextEditingController();

  Rx<String> resumeTitle = 'Untitled'.obs;
  Rx<String> shownMenu = 'createResume'.obs;
  Rx<int> radioSelected = 1.obs;
  Rx<double> textScale = 12.0.obs;
  Rx<double> spaceSize = 0.25.obs;
  final startDate = (null as DateTime?).obs;
  final endDate = (null as DateTime?).obs;

  void setStartDate(DateTime date) {
    startDate.value = date;
  }

  void setEndDate(DateTime date) {
    endDate.value = date;
  }

  changRadio(value){
    radioSelected.value = value;
  }

  changeMenu(String value){
    shownMenu.value = value;
  }

  changeTextScale(double value){
    textScale.value = value;
  }

  changeSpaceSize(double value){
    spaceSize.value = value;
  }

  changeTitle(){
    resumeTitleTC.text = resumeTitle.value;
    Get.dialog(EditResumeTitle());
  }
}