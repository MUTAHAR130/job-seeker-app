import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  TextEditingController jobListingSearchTC = TextEditingController();
  TextEditingController jobListingLocationTC = TextEditingController();

  TextEditingController jobFilterPostCodeTC = TextEditingController();

  TextEditingController filterTitleTC = TextEditingController();

  String debugJobOverView =
      '''The company was founded by compliance and risk management professionals with well over 100 years of experience to address the need for a results driven intelligence based modular platform that addresses key regulatory challenges for the financial services companies globally. Since the system is built by practitioners, it takes into account the structural, policy and operational difficulties faced by different types of financial services firms of various sizes and complexity. Our solution is available as a SaaS or as an onsite solution.

Regional offices are in Karachi, Doha, Qatar, Canada and Bahrain.''';

  String debugJobReq = '''Looking for a creative, skilled UI/UX Designer to design websites with functionality and aesthetics in mind. The UI Developer will work with Back-End Developers and Web Developers to ensure that the website is optimized for several devices and presented in an attractive way. To be successful as a UI Developer you should have excellent knowledge of HTML, JavaScript, and CSS. In addition to this, you must work well in a team as there are several individuals involved in the development process.''';

  final List<String> jobStatusOptions = [
    'NO STATUS',
    'APPLIED',
    'REVIEWED',
    'SHORTLISTED',
    'INTERVIEWED',
    'OFFERED',
    'HIRED',
    'REJECTED',
  ];

  Rx<int> jobFilterSalary = 42.obs;
  Rx<bool> jobFilterAnywhere = false.obs;

  onSalaryChange(double value) {
    jobFilterSalary.value = value.round();
  }

  onAnywhereChange(bool value) {
    jobFilterAnywhere.value = value;
  }
}
