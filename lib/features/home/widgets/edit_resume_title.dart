import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';

class EditResumeTitle extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  EditResumeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCurvedBox(
          margin: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit Resume',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close, size: 25),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    const TextSpan(text: 'Title'),
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
              SizedBox(height: 8),
              InputField(
                controller: homeController.resumeTitleTC,
                hintText: 'Enter name',
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                    bwidth: 50,
                    buttonText: 'Cancel',
                    invertedColor: true,
                    noBorder: true,
                    onPress: () {
                      Get.back();
                    },
                  ),
                  SizedBox(width: 10),
                  ActionButton(
                    bwidth: 50,
                    buttonText: 'Save',
                    onPress: () {
                      homeController.resumeTitle.value = homeController
                          .resumeTitleTC
                          .text
                          .trim();
                      homeController.resumeTitleTC.clear();
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
