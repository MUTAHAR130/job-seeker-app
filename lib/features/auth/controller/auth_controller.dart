import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/auth/widgets/login_fail_dialog.dart';

class AuthController extends GetxController {
  TextEditingController emailFieldTC = TextEditingController();
  TextEditingController passwordFieldTC = TextEditingController();
  TextEditingController confirmPassFieldTC = TextEditingController();
  Rx<bool> passHidden = true.obs;
  Rx<bool> confirmPassHidden = true.obs;
  Rx<bool> rememberCheckBox = false.obs;
  Rx<bool> contactSupportVisible = true.obs;
  Rx<String> verifyStatus = 'not sent'.obs;

  togglePassHidden() {
    passHidden.value = !passHidden.value;
  }

  toggleConfirmPassHidden(){
    confirmPassHidden.value = !confirmPassHidden.value;
  }

  toggleRemember(bool value) {
    rememberCheckBox.value = value;
  }

  sendVerification() {
    if (RegExp(
      r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
    ).hasMatch(emailFieldTC.text.trim())) {
      //logic for verification
      verifyStatus.value = 'pending';
    } else {
      //invalid email
      verifyStatus.value = 'pending';
    }
  }

  loginAction(){
    //login logic
    //on 5 failed logins
    Get.dialog(LoginFailDialog());
    // Get.toNamed(AppRoutes.home);
  }
}
