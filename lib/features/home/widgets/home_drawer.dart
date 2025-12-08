import 'package:flutter/material.dart';
import 'package:job_seeker/features/home/widgets/drawer_tile.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var shw = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: shw * 0.9,
      child: Scaffold(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          // leading: Image.asset('assets/images/app_logo.png'),
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              DrawerTile(
                title: 'Dashboard',
                icon: AppIcons.dashboardIcon,
                selected: true,
              ),
              DrawerTile(
                title: 'Job Search',
                icon: AppIcons.searchIcon,
                selected: false,
              ),
              DrawerTile(
                title: 'AI Interviews',
                icon: AppIcons.aiHelpIcon,
                selected: false,
              ),
              DrawerTile(
                title: 'Video Resumes',
                icon: AppIcons.videoResumeIcon,
                selected: false,
              ),
              DrawerTile(
                title: 'Messages',
                icon: AppIcons.messagesIcon,
                selected: false,
              ),
              DrawerTile(
                title: 'Saved Filters',
                icon: AppIcons.savedFilterIcon,
                selected: false,
              ),
              DrawerTile(
                title: 'Job Settings',
                icon: AppIcons.jobSettingsIcon,
                selected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
