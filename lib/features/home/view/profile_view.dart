import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/bubble_list_widget.dart';
import 'package:job_seeker/core/common/widgets/profile_picture.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';

class ProfileView extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {
              homeController.logOut();
            },
            icon: SvgPicture.string(AppIcons.logoutIcon),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActionButton(
              width: 100,
              buttonText: 'Edit Profile',
              onPress: () {
                homeController.editProfile();
              },
            ),
            SizedBox(height: 15),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: ProfilePicture(
                pictureUrl: homeController.currentUser.profilePicture,
                name: homeController.currentUser.firstName,
                radius: 23,
              ),
              title: Text(
                '${homeController.currentUser.firstName} ${homeController.currentUser.lastName}',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                homeController.currentUser.email,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Get.theme.colorScheme.surface,
                ),
                child: Center(child: SvgPicture.string(AppIcons.bagIcon)),
              ),
              title: Text(
                'Talent Acquisition',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                'HR Department',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
            BubbleListWidget(text: 'MARKETING', onTap: () {}, noOnTap: true),
          ],
        ),
      ),
    );
  }
}
