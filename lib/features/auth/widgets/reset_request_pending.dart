import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card_rich.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';

class ResetRequestPending extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  ResetRequestPending({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCardRich(
      topIcon: AppIcons.emailIcon,
      title: 'Verify Your email address',
      leadingSubTitle: 'We’ve sent a verification link to ',
      subTitle: authController.emailTC.text,
      trailingSubTitle:
          '. Please check your inbox and click the link to verify your request.',
      child: Column(
        children: [
          SizedBox(height: 15),
          ActionButton(
            buttonText: 'Resend Link',
            onPress: () {
              //temp
              authController.verifyStatus.value = 'confirm';
            },
          ),
        ],
      ),
    );
  }
}
