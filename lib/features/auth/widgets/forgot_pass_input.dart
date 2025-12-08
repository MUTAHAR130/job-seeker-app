import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/form_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';

class ForgotPassInput extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  ForgotPassInput({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCurvedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Email Verification',
            style: TextStyle(
              fontSize: 20,
              color: Get.theme.colorScheme.tertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Enter your email address and we\'ll send you a code to reset your password.',
            style: TextStyle(
              fontSize: 14,
              color: Get.theme.colorScheme.tertiary,
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
                  color: Get.theme.colorScheme.tertiary,
                  fontWeight: FontWeight.w400,
                ),
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
          SizedBox(height: 10),
          InputField(
            controller: authController.emailFieldTC,
            hintText: 'Enter email',
          ),
          SizedBox(height: 15),
          FormButton(
            buttonText: 'Send Reset Link',
            onPress: authController.sendVerification,
          ),
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 14,
                color: Get.theme.colorScheme.tertiary,
                fontWeight: FontWeight.w400,
              ),
              children: <TextSpan>[
                const TextSpan(text: 'Remember you password? '),
                const TextSpan(
                  text: 'Login',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
