import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/features/home/models/saved_resume_model.dart';
import 'package:job_seeker/features/home/models/score_sub_category_model.dart';
import 'package:job_seeker/features/home/widgets/edit_resume_title.dart';

class ResumeController extends GetxController {
  TextEditingController resumeTitleTC = TextEditingController();

  //basic info fields
  TextEditingController nameFieldTC = TextEditingController();
  TextEditingController emailFieldTC = TextEditingController();
  TextEditingController addressFieldTC = TextEditingController();
  TextEditingController phoneFieldTC = TextEditingController();

  //prof sum fields
  TextEditingController profSumTC = TextEditingController();

  //work fields
  TextEditingController jobTitleTC = TextEditingController();
  TextEditingController jobCompanyTC = TextEditingController();
  TextEditingController workDescTC = TextEditingController();

  //edu fields
  TextEditingController degreeTitleTC = TextEditingController();
  TextEditingController instituteTC = TextEditingController();
  TextEditingController eduDescTC = TextEditingController();

  //cert fields
  TextEditingController certNameTC = TextEditingController();
  TextEditingController certOrganizationTC = TextEditingController();
  TextEditingController certDescTC = TextEditingController();

  //award fields
  TextEditingController awardNameTC = TextEditingController();
  TextEditingController awardOrganizationTC = TextEditingController();
  TextEditingController awardDescTC = TextEditingController();

  //skill fields
  TextEditingController skillTC = TextEditingController();

  //job detail dialog fields
  TextEditingController jobDialogTitleTC = TextEditingController();
  TextEditingController jobDialogCompanyTC = TextEditingController();
  TextEditingController jobDialogDescTC = TextEditingController();

  //job listing dialog fields

  TextEditingController jobListingSearchTC = TextEditingController();
  TextEditingController jobListingLocationTC = TextEditingController();
  List<ScoreSubCategoryModel> structureFormatingCats = [
    ScoreSubCategoryModel(
      subTitle: 'ATS may not detect Work Experience, Education, or Skills.',
      title: 'Headings',
      statusIcon: AppIcons.warningIcon,
    ),
    ScoreSubCategoryModel(
      subTitle: 'Content may not be read properly by ATS.',
      title: 'Single-column layout',
      statusIcon: AppIcons.warningIcon,
    ),
    ScoreSubCategoryModel(
      subTitle: 'Content is plain text and fully ATS-friendly.',
      title: 'No images, tables, or text boxes',
      statusIcon: AppIcons.checkMarkIcon,
    ),
    ScoreSubCategoryModel(
      subTitle: 'Your text is readable by all screening systems.',
      title: 'ATS-friendly fonts',
      statusIcon: AppIcons.checkMarkIcon,
    ),
  ];

  Rx<String> resumeTitle = 'Untitled'.obs;
  Rx<int> generateResumeRadioSelected = 1.obs;
  Rx<int> tailoredResumeRadioSelected = 1.obs;
  Rx<int> generateLetterRadioSelected = 1.obs;
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

  changeGenerateResumeRadio(value) {
    generateResumeRadioSelected.value = value;
  }

  changeTailoredResumeRadio(value) {
    tailoredResumeRadioSelected.value = value;
  }

  changeLetterRadio(value) {
    generateLetterRadioSelected.value = value;
  }

  changeTextScale(double value) {
    textScale.value = value;
  }

  changeSpaceSize(double value) {
    spaceSize.value = value;
  }

  changeTitle() {
    resumeTitleTC.text = resumeTitle.value;
    Get.dialog(EditResumeTitle());
  }
}
