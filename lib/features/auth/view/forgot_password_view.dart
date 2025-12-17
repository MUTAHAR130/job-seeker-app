import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';
import 'package:job_seeker/features/auth/widgets/forgot_pass_input.dart';
import 'package:job_seeker/features/auth/widgets/reset_pass_confirm.dart';
import 'package:job_seeker/features/auth/widgets/reset_request_pending.dart';

class ForgotPasswordView extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) {
          //other logic
          authController.verifyStatus.value = 'not sent';
          authController.currentPassFieldTC.clear();
          authController.newPassFieldTC.clear();
          authController.passHidden.value = true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Forgot Password',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Obx(() {
              if (authController.verifyStatus.value == 'pending'){
                return ResetRequestPending();
              } else if (authController.verifyStatus.value == 'confirm'){
                return ResetPassConfirm();
              } else {
                return ForgotPassInput();
              }
            }),
          ),
        ),
      ),
    );
  }
}
