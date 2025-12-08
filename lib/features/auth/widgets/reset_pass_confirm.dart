import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/form_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';

class ResetPassConfirm extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  ResetPassConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCurvedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Reset Password',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Now that we know it’s you, please create a new password to sign in.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
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
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                children: <TextSpan>[
                  const TextSpan(text: 'Confirm Password'),
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
              controller: authController.confirmPassFieldTC,
              hidden: authController.confirmPassHidden.value,
              hiddenToggle: authController.toggleConfirmPassHidden,
              hintText: 'Enter confirm password',
            ),
          ),
          SizedBox(height: 15),
          FormButton(
            buttonText: 'Reset Password',
            onPress: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
