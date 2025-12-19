import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_seeker/core/common/constant/app_constants.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/core/services/shared_data.dart';
import 'package:job_seeker/features/home/data/services/home_api_services.dart';
import 'package:job_seeker/features/home/models/drawer_option_model.dart';
import 'package:job_seeker/features/dashboard/models/saved_resume_model.dart';
import 'package:job_seeker/features/home/models/profile_details_model.dart';
import 'package:job_seeker/features/home/models/profile_model.dart';
import 'package:job_seeker/features/home/models/user_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    initialize();
  }

  initialize() async {
    if (await SharedData.containKey(AppConstants.tokenKey)) {
      try {
        var response = await HomeApiServices.getUser();
        currentUser = UserModel.fromJson(response['user']);
        getProfile();
        Get.offNamed(AppRoutes.home);
      } catch (e) {
        debugPrint('error $e');
        Get.offNamed(AppRoutes.loginView);
      }
    } else {
      Get.offNamed(AppRoutes.loginView);
    }
  }

  Rx<int> selectedPageIndex = 0.obs;

  UserModel currentUser = UserModel(
    id: 'id',
    email: 'email',
    firstName: 'firstName',
    lastName: 'lastName',
    gender: 'gender',
    userType: 'userType',
    createdAt: DateTime.now(),
    accountStatus: 'accountStatus',
    isEmailVerified: false,
    connectedAccounts: [],
    twoFactorEnabled: false,
    planId: 'planId',
  );

  ProfileModel currentUserProfile = ProfileModel(
    id: 'id',
    email: 'email',
    firstName: 'firstName',
    lastName: 'lastName',
    gender: 'gender',
  );

  ProfileDetailsModel currentUserProfileDetails = ProfileDetailsModel(
    id: 'id',
    email: 'email',
    firstName: 'firstName',
    lastName: 'lastName',
    gender: 'gender',
    userType: 'userType',
    accountStatus: 'accountStatus',
    isEmailVerified: false,
    twoFactorEnabled: false,
    connectedAccounts: [],
    planId: 'planId',
  );

  List<DrawerOptionModel> drawerOptions = [
    DrawerOptionModel(
      title: 'Dashboard',
      drawerIcon: AppIcons.dashboardIcon,
      filledDrawerIcon: AppIcons.filledDashboardIcon,
      selected: true,
      pageRoute: AppRoutes.home,
    ),
    DrawerOptionModel(
      title: 'Job Search',
      drawerIcon: AppIcons.searchIcon,
      filledDrawerIcon: AppIcons.filledSearchIcon,
      selected: false,
      pageRoute: AppRoutes.jobSearchView,
    ),
    DrawerOptionModel(
      title: 'AI Interviews',
      drawerIcon: AppIcons.aiHelpIcon,
      filledDrawerIcon: AppIcons.filledAIHelpICon,
      selected: false,
      pageRoute: '',
    ),
    DrawerOptionModel(
      title: 'Video Resumes',
      drawerIcon: AppIcons.videoResumeIcon,
      filledDrawerIcon: AppIcons.filledVideoResumeIcon,
      selected: false,
      pageRoute: AppRoutes.videoResumeView,
    ),
    DrawerOptionModel(
      title: 'Messages',
      drawerIcon: AppIcons.messagesIcon,
      filledDrawerIcon: AppIcons.filledMessageIcon,
      selected: false,
      pageRoute: AppRoutes.messageView,
    ),
    DrawerOptionModel(
      title: 'Saved Filters',
      drawerIcon: AppIcons.savedFilterIcon,
      filledDrawerIcon: AppIcons.savedFilterIcon,
      selected: false,
      pageRoute: AppRoutes.savedFiltersView,
    ),
    DrawerOptionModel(
      title: 'Job Settings',
      drawerIcon: AppIcons.jobSettingsIcon,
      filledDrawerIcon: AppIcons.filledJobSettingsIcon,
      selected: false,
      pageRoute: AppRoutes.jobSettingsView,
    ),
  ];

  List<SavedResumeModel> savedResumeData = [
    SavedResumeModel(
      title: 'Resume 1',
      resumeAsset: 'assets/docs/Resume1.pdf',
      isDefault: true,
    ),
    SavedResumeModel(
      title: 'Resume 2',
      resumeAsset: 'assets/docs/Resume1.pdf',
      isDefault: false,
    ),
  ];

  List<SavedResumeModel> savedCoverLetterData = [
    SavedResumeModel(
      title: 'Cover Letter 1',
      resumeAsset: 'assets/docs/Resume1.pdf',
      isDefault: true,
    ),
    SavedResumeModel(
      title: 'Cover Letter 2',
      resumeAsset: 'assets/docs/Resume1.pdf',
      isDefault: false,
    ),
  ];

  Rx<String> shownResumeMenu = 'createResume'.obs;
  Rx<String> shownLetterMenu = 'createLetter'.obs;

  changeMenu(String value) {
    shownResumeMenu.value = value;
  }

  changeDrawer(index) async {
    for (var campaign in drawerOptions) {
      campaign.selected = false;
    }
    drawerOptions[index].selected = true;
    selectedPageIndex.value = index;
    update(['homeDrawer']);
    await Future.delayed(Duration(milliseconds: 500));
    Get.back();
  }

  getProfile() async {
    var response = await HomeApiServices.getProfile();
    currentUserProfile = ProfileModel.fromJson(response['user']);
    // var response2 = await HomeApiServices.getProfileDetail();
    // currentUserProfileDetails = ProfileDetailsModel.fromJson(response2['user']);
  }

  changeAvatar() async {
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    final pdfMultipart = await http.MultipartFile.fromPath(
      'avatar',
      result!.path,
      filename: result.name,
      contentType: http.MediaType('image', 'jpeg'),
    );

    var response = await HomeApiServices.uploadAvatar(pdfMultipart);
    currentUser.profilePicture = response['avatarUrl'];
  }

  logOut() async {
    await SharedData.removeKey(AppConstants.tokenKey);
    Get.offAllNamed(AppRoutes.loginView);
  }
}
