import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/profile_picture.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/dashboard/controller/new_resume_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';

class BasicInfoTab extends StatelessWidget {
  final NewResumeController newResumeController =
      Get.find<NewResumeController>();
  final HomeController homeController = Get.find<HomeController>();

  BasicInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Basic Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            WhiteCurvedBox(
              margin: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: (){
                          newResumeController.getAvatar();
                        },
                        child:
                            newResumeController.selectedPicture.value == null
                            ? ProfilePicture(
                                pictureUrl: homeController.currentUser.profilePicture,
                                name: homeController.currentUser.firstName,
                                radius: 30,
                              )
                            : CircleAvatar(
                                radius: 35,
                                backgroundImage: FileImage(
                                  File(
                                    newResumeController
                                        .selectedPicture
                                        .value!
                                        .path,
                                  ),
                                ),
                              ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: SvgPicture.string(AppIcons.editBoxRoundIcon),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  InputField(
                    controller: newResumeController.nameFieldTC,
                    label: 'Full Name',
                    mandatory: true,
                    hintText: 'Enter name',
                  ),
                  SizedBox(height: 15),
                  InputField(
                    controller: newResumeController.emailFieldTC,
                    label: 'Contact Email',
                    mandatory: true,
                    hintText: 'Enter email',
                  ),
                  SizedBox(height: 15),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Phone Number '),
                        const TextSpan(
                          text: '(optional)',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  InputField(
                    controller: newResumeController.phoneNumberTC,
                    hintText: 'Enter phone number',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ActionButton(
                buttonText: 'Save Basic Information',
                onPress: () {},
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
