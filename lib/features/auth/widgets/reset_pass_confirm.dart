import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';

class ResetPassConfirm extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  ResetPassConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Reset Password',
      subTitle:
          'Now that we know it’s you, please create a new password to sign in.',
      child: Column(
        children: [
          SizedBox(height: 15),
          Obx(
            () => InputField(
              controller: authController.passwordFieldTC,
              label: 'Password',
              mandatory: true,
              hidden: authController.passHidden.value,
              hiddenToggle: authController.togglePassHidden,
              hintText: 'Enter password',
            ),
          ),
          SizedBox(height: 15),
          Obx(
            () => InputField(
              controller: authController.confirmPassFieldTC,
              label: 'Confirm Password',
              mandatory: true,
              hidden: authController.confirmPassHidden.value,
              hiddenToggle: authController.toggleConfirmPassHidden,
              hintText: 'Enter confirm password',
            ),
          ),
          SizedBox(height: 15),
          ActionButton(
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
