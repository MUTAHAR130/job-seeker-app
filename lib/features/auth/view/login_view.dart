import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Center(
        child: WhiteCurvedBox(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.string(
                      AppIcons.googleIconSvg,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.string(
                      AppIcons.windowsIconSvg,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.string(
                      AppIcons.linkedinIconSvg,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              Text(
                'or',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      const TextSpan(text: 'Email'),
                      const TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InputField(
                controller: authController.emailFieldTC,
                hintText: 'Enter email',
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      const TextSpan(text: 'Password'),
                      const TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => InputField(
                  controller: authController.passwordFieldTC,
                  hidden: authController.passHidden.value,
                  hiddenToggle: authController.togglePassHidden,
                  hintText: 'Enter password',
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
                      Get.toNamed(AppRoutes.forgotPassword);
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
              SizedBox(height: 14),
              ActionButton(buttonText: 'Login', onPress: authController.loginAction),
            ],
          ),
        ),
      ),
    );
  }
}
