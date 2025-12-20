import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';

class ForgotPassInput extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  ForgotPassInput({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Email Verification',
      subTitle:
          'Enter your email address and we\'ll send you a code to reset your password.',
      child: Column(
        children: [
          SizedBox(height: 15),
          InputField(
            controller: authController.emailTC,
            label: 'Email',
            mandatory: true,
            hintText: 'Enter email',
          ),
          SizedBox(height: 15),
          ActionButton(
            buttonText: 'Send Reset Link',
            onPress: authController.sendResetEmail,
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
