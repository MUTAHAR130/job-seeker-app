import 'package:flutter/material.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:job_seeker/features/home/widgets/drawer_tile.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Scaffold(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 195,
                    height: 36,
                    child: Image.asset(
                      'assets/images/app_logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              GetBuilder(
                init: homeController,
                id: 'homeDrawer',
                builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeController.drawerOptions.length,
                    itemBuilder: (context, index) {
                      return DrawerTile(
                        title: controller.drawerOptions[index].title,
                        icon: controller.drawerOptions[index].drawerIcon,
                        selected: controller.drawerOptions[index].selected,
                        onTap: () {
                          for (var campaign in controller.drawerOptions) {
                            campaign.selected = false;
                          }
                          controller.drawerOptions[index].selected = true;
                          Get.toNamed(
                            controller.drawerOptions[index].pageRoute,
                          );
                          controller.update(['homeDrawer']);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
