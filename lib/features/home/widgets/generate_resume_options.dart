import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_card.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/widgets/radio_tile.dart';

class GenerateResumeOptions extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  GenerateResumeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: WhiteCard(
          topIcon: AppIcons.createResumeIcon,
          title: 'Select Resume Type',
          child: Column(
            children: [
              Obx(()=>RadioTile(
                radioVal: 1,
                groupVal: homeController.radioSelected.value,
                title: 'General Resume',
                subtitle:
                    'A standard resume generated from your profile. Best for general applications.',
                changeVal: homeController.changRadio,
              )),
              SizedBox(height: 10),
              Obx(()=>RadioTile(
                radioVal: 2,
                groupVal: homeController.radioSelected.value,
                title: 'Job Tailored Resume',
                subtitle:
                    'A customized resume matched to a specific job description you provide.',
                changeVal: homeController.changRadio,
              )),
              SizedBox(height: 10),
              ActionButton(
                buttonText: 'Generate Resume',
                onPress: () {
                  Get.toNamed(AppRoutes.resumeTemplate);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
