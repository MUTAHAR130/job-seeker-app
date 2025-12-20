import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/profile_picture.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';

class EditProfileDialog extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  EditProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            WhiteCard(
              secondary: true,
              title: 'Edit Profile',
              onCancel: () {
                homeController.selectedPicture.value = null;
                Get.back();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WhiteCurvedBox(
                    color: Get.theme.colorScheme.outline,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Obx(() => InkWell(
                                onTap: (){homeController.getAvatar();},
                                child:
                                    homeController.selectedPicture.value == null
                                    ? ProfilePicture(
                                        pictureUrl: homeController.currentUser.profilePicture,
                                        name: homeController.currentUser.firstName,
                                        radius: 35,
                                      )
                                    : CircleAvatar(
                                        radius: 35,
                                        backgroundImage: FileImage(
                                          File(
                                            homeController
                                                .selectedPicture
                                                .value!
                                                .path,
                                          ),
                                        ),
                                      ),
                              )),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: Get.theme.colorScheme.primary,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 12,
                                    color: Get.theme.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Edit Profile Picture',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Click the camera to change',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  InputField(
                    label: 'First Name',
                    mandatory: true,
                    controller: homeController.profileFNameTC,
                    hintText: 'Enter first name',
                  ),
                  SizedBox(height: 15),
                  InputField(
                    label: 'Last Name',
                    controller: homeController.profileLNameTC,
                    hintText: 'Enter last name',
                  ),
                  SizedBox(height: 15),
                  InputField(
                    label: 'Phone Number',
                    controller: homeController.phoneNumberTC,
                    hintText: 'Enter phone number',
                  ),
                  SizedBox(height: 15),
                  LabeledDropDownMenu(
                    label: 'Gender',
                    defaultValue: homeController.selectedGender,
                    items: homeController.genderOptions,
                    onChange: homeController.setGender,
                    hintText: '',
                    itemHeight: 35,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ActionButton(
                        width: 50,
                        buttonText: 'Cancel',
                        inverted: true,
                        noBorder: true,
                        onPress: () {
                          Get.back();
                        },
                      ),
                      SizedBox(width: 10),
                      ActionButton(
                        width: 90,
                        buttonText: 'Save profile',
                        onPress: () {
                          homeController.saveProfile();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
