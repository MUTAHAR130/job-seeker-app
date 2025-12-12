import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UploadVideoController extends GetxController{
  TextEditingController videoTitleTC = TextEditingController();

  Rx<bool> videoUploaded = false.obs;

  onUpload(){
    videoUploaded.value = !videoUploaded.value;
  }
}