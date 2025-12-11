import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/dashboard/widgets/edit_resume_title.dart';

class CoverLetterController extends GetxController {
  TextEditingController resumeTitleTC = TextEditingController();

  //cover letter details
  TextEditingController nameFieldTC = TextEditingController();
  TextEditingController emailFieldTC = TextEditingController();
  TextEditingController addressFieldTC = TextEditingController();
  TextEditingController phoneFieldTC = TextEditingController();
  TextEditingController workDescTC = TextEditingController();

  //job detail dialog fields
  TextEditingController jobDialogTitleTC = TextEditingController();
  TextEditingController jobDialogCompanyTC = TextEditingController();
  TextEditingController jobDialogDescTC = TextEditingController();

  Rx<String> coverTitle = 'Untitled'.obs;
  Rx<int> generateLetterRadioSelected = 1.obs;

  changeTitle() {
    resumeTitleTC.text = coverTitle.value;
    Get.dialog(EditTitle());
  }

  changeLetterRadio(value) {
    generateLetterRadioSelected.value = value;
  }
}
