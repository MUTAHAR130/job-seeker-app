import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  TextEditingController nameFieldTC = TextEditingController();
  TextEditingController emailFieldTC = TextEditingController();
  TextEditingController profSumTC = TextEditingController();
  Rx<String> shownMenu = 'createResume'.obs;
  Rx<int> radioSelected = 1.obs;
  Rx<double> textScale = 12.0.obs;
  Rx<double> spaceSize = 0.25.obs;

  changRadio(value){
    radioSelected.value = value;
  }

  changeMenu(String value){
    shownMenu.value = value;
  }

  changeTextScale(double value){
    textScale.value = value;
  }

  changeSpaceSize(double value){
    spaceSize.value = value;
  }
}