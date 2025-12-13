import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AIInterviewController extends GetxController{
  TextEditingController jobSearchTC = TextEditingController();
  TextEditingController jobLocationTC = TextEditingController();

  TextEditingController listSearchTC = TextEditingController();

  Rx<int> responseModeRadio = 1.obs;
  Rx<int> interviewContextRadio = 1.obs;

  changeResponseModeRadio(value){
    responseModeRadio.value = value;
  }

  changeInterviewContextRadio(value){
    interviewContextRadio.value = value;
  }
}