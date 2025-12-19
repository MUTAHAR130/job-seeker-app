import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/constant/app_constants.dart';
import 'package:job_seeker/core/common/widgets/custom_snack_bar.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/core/services/shared_data.dart';
import 'package:job_seeker/features/auth/data/services/auth_api_services.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/home/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//336131264914-ln1njhurimdvqqejc9ipnih4qqsncesp.apps.googleusercontent.com

class AuthController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  TextEditingController nameTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  TextEditingController currentPassTC = TextEditingController();
  TextEditingController confirmPassTC = TextEditingController();

  FocusNode nameFN = FocusNode();
  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();
  FocusNode confirmPassFN = FocusNode();

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
    if (RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(emailTC.text.trim())) {
      // await _repository.sendVerificationEmail(emailFieldTC.text.trim());
      // verifyStatus.value = 'pending';
    } else {
      //invalid email
      verifyStatus.value = 'pending';
    }
  }

  showError() {
    passwordTC.clear();
    CustomSnackBar.showFailedSnackBar('Invalid email or password');
  }

  changePass() async {
    var response = await AuthApiService.changePass('12345678', '123456789');
    debugPrint('pass change response:${response['message']}');
  }

  signInAction() async {
    nameFN.unfocus();
    emailFN.unfocus();
    passFN.unfocus();
    confirmPassFN.unfocus();
    try {
      var response = await AuthApiService.signInWithEmail(
        emailTC.text.trim(),
        passwordTC.text.trim(),
        confirmPassTC.text.trim(),
        nameTC.text.trim(),
        'JOBSEEKER',
      );
      homeController.currentUser = UserModel.fromJson(response['newUserCreated']);
      homeController.getProfile();
      SharedData.setPrefsString(AppConstants.tokenKey, response['authToken']);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      CustomSnackBar.showFailedSnackBar('User already exists with this email');
      debugPrint('error: $e');
    }
  }

  googleLoginAction() async {
    try {
      var credential = await _handleGoogleLogin();
      // credential.user.uid;
      if (credential != null) {
        debugPrint('$credential');
        var response = await AuthApiService.loginWithGoogle(credential.user!.uid);
        homeController.currentUser = UserModel.fromJson(response['user']);
        homeController.getProfile();
        SharedData.setPrefsString(AppConstants.tokenKey, response['authToken']);
        Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  loginAction() async {
    emailFN.unfocus();
    passFN.unfocus();
    try {
      var response = await AuthApiService.loginWithEmail(
        emailTC.text.trim(),
        passwordTC.text.trim(),
      );
      // var response = await AuthApiService.devLoginWithEmail(
      //   emailFieldTC.text.trim(),
      // );
      homeController.currentUser = UserModel.fromJson(response['user']);
      homeController.getProfile();
      SharedData.setPrefsString(AppConstants.tokenKey, response['authToken']);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      debugPrint('error: $e');
    }
    //on 5 failed logins
    // Get.dialog(LoginFailDialog());
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile', 'openid'],
    serverClientId:
        '336131264914-ln1njhurimdvqqejc9ipnih4qqsncesp.apps.googleusercontent.com',
  );

  Future<UserCredential?> _handleGoogleLogin() async {
    // final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    //
    // await googleSignIn.initialize();
    //
    // // Trigger the authentication flow
    // final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return null;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential =
    GoogleAuthProvider.credential(idToken: googleAuth?.idToken);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
