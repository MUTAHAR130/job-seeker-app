import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';

class LoginView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  LoginView({super.key});

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
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.16),
            WhiteCurvedBox(
              margin: 24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  ActionButton(
                    inverted: true,
                    prefixIcon: AppIcons.googleIconSvg,
                    buttonText: 'Continue with Google',
                    onPress: () {
                      // authController.googleLoginAction();
                    },
                  ),
                  SizedBox(height: 15),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: SvgPicture.string(
                  //         AppIcons.googleIconSvg,
                  //         height: 24,
                  //         width: 24,
                  //       ),
                  //     ),
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: SvgPicture.string(
                  //         AppIcons.windowsIconSvg,
                  //         height: 24,
                  //         width: 24,
                  //       ),
                  //     ),
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: SvgPicture.string(
                  //         AppIcons.linkedinIconSvg,
                  //         height: 24,
                  //         width: 24,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Text(
                    'or',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => SizedBox(
                              height: 16,
                              width: 24,
                              child: Checkbox(
                                value: authController.rememberCheckBox.value,
                                onChanged: (value) {
                                  authController.rememberCheckBox(value);
                                },
                              ),
                            ),
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          authController.emailFN.unfocus();
                          authController.passFN.unfocus();
                          Get.toNamed(AppRoutes.forgotPasswordView);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ActionButton(
                    buttonText: 'Login',
                    onPress: authController.loginAction,
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: (){
                      Get.offAllNamed(AppRoutes.signInView);
                    },
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Don\'t have and account? '),
                          TextSpan(
                            text: 'Create Account',
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
