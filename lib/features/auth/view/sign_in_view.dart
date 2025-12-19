import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';

class SignInView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Center(
          child: SizedBox(
            width: 195,
            height: 36,
            child: Image.asset(
              'assets/images/app_logo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
            WhiteCurvedBox(
              margin: 24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  // SizedBox(height: 15),
                  // ActionButton(
                  //   inverted: true,
                  //   prefixIcon: AppIcons.googleIconSvg,
                  //   buttonText: 'Continue with Google',
                  //   onPress: () {},
                  // ),
                  // SizedBox(height: 15),
                  // Text(
                  //   'or',
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  // ),
                  SizedBox(height: 15),
                  InputField(
                    controller: authController.nameTC,
                    label: 'Full Name',
                    mandatory: true,
                    hintText: 'Enter full name',
                    focusNode: authController.nameFN,
                  ),
                  SizedBox(height: 15),
                  InputField(
                    controller: authController.emailTC,
                    label: 'Email',
                    mandatory: true,
                    hintText: 'Enter email',
                    focusNode: authController.emailFN,
                  ),
                  SizedBox(height: 15),
                  Obx(
                    () => InputField(
                      controller: authController.passwordTC,
                      label: 'Password',
                      mandatory: true,
                      hidden: authController.passHidden.value,
                      hiddenToggle: authController.togglePassHidden,
                      hintText: 'Enter password',
                      focusNode: authController.passFN,
                    ),
                  ),
                  SizedBox(height: 15),
                  Obx(
                    () => InputField(
                      controller: authController.confirmPassTC,
                      label: 'Confirm Password',
                      mandatory: true,
                      hidden: authController.confirmPassHidden.value,
                      hiddenToggle: authController.toggleConfirmPassHidden,
                      hintText: 'Enter password again',
                      focusNode: authController.confirmPassFN,
                    ),
                  ),
                  SizedBox(height: 15),
                  ActionButton(
                    buttonText: 'Sign In',
                    onPress: authController.signInAction,
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: (){
                      Get.offAllNamed(AppRoutes.loginView);
                    },
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Already have an account? '),
                          TextSpan(
                            text: 'Log In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
