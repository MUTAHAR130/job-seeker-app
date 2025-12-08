import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/widgets/form_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';

class ResetRequestPending extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  ResetRequestPending({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCurvedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.string(AppIcons.emailIcon),
          SizedBox(height: 15),
          Text(
            'Verify Your email address',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              children: <TextSpan>[
                const TextSpan(text: 'We’ve sent a verification link to '),
                TextSpan(
                  text: authController.emailFieldTC.text,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const TextSpan(
                  text:
                      '. Please check your inbox and click the link to verify your request.',
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          FormButton(buttonText: 'Resend Link', onPress: () {
            //temp
            authController.verifyStatus.value = 'confirm';
          }),
        ],
      ),
    );
  }
}
