import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:get/get.dart';

class VerifyEmailDialog extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  VerifyEmailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCurvedBox(
          margin: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {Get.back();},
                  icon: Icon(
                    Icons.close,
                    size: 25,
                    color: Get.theme.colorScheme.tertiary,
                  ),
                ),
              ),
              SvgPicture.string(AppIcons.emailIcon),
              SizedBox(height: 15),
              Text(
                'Verify Your email address',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    const TextSpan(text: 'We’ve sent an email to '),
                    TextSpan(
                      text: authController.emailFieldTC.text,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const TextSpan(
                      text:
                          ' to verify your email address and activate your account.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Resend Link',
                onPress: () {
                  Get.back();
                },
              ),
              SizedBox(height: 15),
              Obx(
                () => Visibility(
                  visible: authController.contactSupportVisible.value,
                  child: ActionButton(
                    buttonText: 'Contact Support',
                    inverted: true,
                    onPress: () {
                      Get.offAllNamed(AppRoutes.home);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
