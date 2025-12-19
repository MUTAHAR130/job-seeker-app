import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/colors/theme_data.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/core/services/shared_data.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedData.initPrefs();
  Get.put(HomeController());
  runApp(
    GetMaterialApp(
      title: "Job Seeker",
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashScreen,
    ),
  );
}

//TODO: test out video player
//TODO: test out recording video
