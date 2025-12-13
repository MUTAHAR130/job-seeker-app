import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MockInterviewController extends GetxController {
  TextEditingController answerTC = TextEditingController();

  Rx<int> questionProgress = 1.obs;
  Rx<bool> showFeedback = false.obs;
}
