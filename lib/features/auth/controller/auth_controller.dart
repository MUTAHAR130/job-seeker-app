import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/constant/app_constants.dart';
import 'package:job_seeker/core/common/widgets/custom_snack_bar.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/core/services/shared_data.dart';
import 'package:job_seeker/features/auth/data/services/auth_api_services.dart';
import 'package:job_seeker/features/auth/widgets/login_fail_dialog.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/home/models/user_model.dart';

class AuthController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  TextEditingController emailFieldTC = TextEditingController();
  TextEditingController passwordFieldTC = TextEditingController();
  TextEditingController currentPassFieldTC = TextEditingController();
  TextEditingController newPassFieldTC = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  Rx<bool> passHidden = true.obs;
  Rx<bool> confirmPassHidden = true.obs;
  Rx<bool> rememberCheckBox = false.obs;
  Rx<bool> contactSupportVisible = true.obs;
  Rx<String> verifyStatus = 'not sent'.obs;

  togglePassHidden() {
    passHidden.value = !passHidden.value;
  }

  toggleConfirmPassHidden() {
    confirmPassHidden.value = !confirmPassHidden.value;
  }

  toggleRemember(bool value) {
    rememberCheckBox.value = value;
  }

  sendVerification() async {
    if (RegExp(
      r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
    ).hasMatch(emailFieldTC.text.trim())) {
      // await _repository.sendVerificationEmail(emailFieldTC.text.trim());
      // verifyStatus.value = 'pending';
    } else {
      //invalid email
      verifyStatus.value = 'pending';
    }
  }

  showError() {
    passwordFieldTC.clear();
    CustomSnackBar.showFailedSnackBar('Invalid email or password');
  }

  changePass() async {
    var response = await AuthApiService.changePass('12345678', '123456789');
    debugPrint('pass change response:${response['message']}');
  }

  loginAction() async {
    emailFocusNode.unfocus();
    passFocusNode.unfocus();
    var response = await AuthApiService.loginWithEmail(
      emailFieldTC.text.trim(),
      passwordFieldTC.text.trim(),
    );
    homeController.currentUser = UserModel.fromJson(response['user']);

    SharedData.setPrefsString(AppConstants.tokenKey, response['authToken']);
    Get.offAllNamed(AppRoutes.home);

    //on 5 failed logins
    // Get.dialog(LoginFailDialog());
  }
}
