import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/colors/theme_data.dart';
import 'package:job_seeker/core/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Job Seeker",
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.login,
    ),
  );
}


//TODO: fix drop down menu style
//TODO: fix video thumbnails
//TODO: fix snack bar alignment
//TODO: finish recording video part