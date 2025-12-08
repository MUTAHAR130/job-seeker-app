import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/widgets/form_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/auth/widgets/verify_email_dialog.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';

class LoginFailDialog extends StatelessWidget {
  const LoginFailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCurvedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {Get.back();},
                  icon: Icon(Icons.close, size: 25, color: Get.theme.colorScheme.tertiary,),
                ),
              ),
              SvgPicture.string(AppIcons.failedIcon),
              SizedBox(height: 15),
              Text(
                'Login attempt failed',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                'Your account has been temporarily locked due to multiple unsuccessful login attempts.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              FormButton(
                buttonText: 'Verify your email address',
                onPress: () {
                  Get.back();
                  Get.dialog(VerifyEmailDialog());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
