import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/features/dashboard/data/services/dashboard_api_services.dart';
import 'package:job_seeker/features/dashboard/models/job_data_model.dart';
import 'package:job_seeker/features/dashboard/models/resume_template_model.dart';
import 'package:job_seeker/features/dashboard/models/score_sub_category_model.dart';
import 'package:job_seeker/features/dashboard/widgets/dialogs/edit_resume_dialog.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/home/data/services/home_api_services.dart';
import 'package:job_seeker/features/home/models/profile_details_model.dart';
import 'package:http/http.dart' as http;

class NewResumeController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();
  List<ResumeTemplateModel> templateData = [];
  bool initial = true;
  String selectedTemplate = '';
  String selectedJob = '';

  getResumeTemplates() async {
    initial = false;
    var response = await DashboardApiServices.getResumeTemplates();
    for (var template in response['templates']) {
      templateData.add(ResumeTemplateModel.fromJson(template));
    }
  }

  ProfileDetailsModel? profileDetails = null;

  generateResumeFromTemplate() async {
    profileDetails!.email = emailFieldTC.text.trim();
    profileDetails!.phoneNumber = phoneNumberTC.text.trim();

    JobDataModel? jobData = null;
    if (selectedJob == '') {
      jobData = JobDataModel(
        company: jobDialogCompanyTC.text.trim(),
        role: jobDialogTitleTC.text.trim(),
        description: jobDialogDescTC.text.trim(),
        keywords: [],
        requirements: [],
        skills: [],
        internalJobId: '',
      );
    }
    await DashboardApiServices.generateResume(
      selectedTemplate,
      resumeTitleTC.text.trim(),
      profileDetails!,
      jobData,
      selectedJob,
    );
  }

  TextEditingController resumeTitleTC = TextEditingController();

  //basic info fields
  String profileUrl = '';
  var selectedPicture = Rxn<XFile>();
  TextEditingController nameFieldTC = TextEditingController();
  TextEditingController emailFieldTC = TextEditingController();
  TextEditingController phoneNumberTC = TextEditingController();

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

  //job listing dialog fields
  TextEditingController jobSearchTC = TextEditingController();
  TextEditingController jobLocationTC = TextEditingController();
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

  //job dialog fields
  TextEditingController jobDialogTitleTC = TextEditingController();
  TextEditingController jobDialogCompanyTC = TextEditingController();
  TextEditingController jobDialogDescTC = TextEditingController();

  Rx<String> resumeTitle = 'Untitled'.obs;
  Rx<int> generateResumeRadioSelected = 1.obs;
  Rx<int> tailoredResumeRadioSelected = 1.obs;
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

  changeTextScale(double value) {
    textScale.value = value;
  }

  changeSpaceSize(double value) {
    spaceSize.value = value;
  }

  changeTitle() {
    resumeTitleTC.text = resumeTitle.value;
    Get.dialog(EditTitleDialog());
  }

  getAvatar() async {
    selectedPicture.value = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    changeAvatar();
  }

  changeAvatar() async {
    try {
      final pdfMultipart = await http.MultipartFile.fromPath(
        'avatar',
        selectedPicture.value!.path,
        filename: selectedPicture.value!.name,
        contentType: http.MediaType('image', 'jpeg'),
      );

      await HomeApiServices.uploadAvatar(pdfMultipart);
      selectedPicture.value = null;
    } catch (e) {
      debugPrint('$e');
    }
  }

  resumeGenerationSetup() async {
    var response = await HomeApiServices.getProfileDetail();
    profileDetails = ProfileDetailsModel.fromJson(response['user']);
    resumeTitleTC.text = 'Untitled';

    nameFieldTC.text = '${profileDetails!.fullName}';
    emailFieldTC.text = profileDetails!.email;
    phoneNumberTC.text = profileDetails!.phoneNumber ?? '';
  }
}
