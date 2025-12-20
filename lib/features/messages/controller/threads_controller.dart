import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/messages/data/services/message_api_services.dart';
import 'package:job_seeker/features/messages/models/thread_model.dart';

//expected one of \"JOB_SPECIFIC\"|\"GENERAL_OUTREACH\"|\"INTERNAL_TEAM\"|\"ORG_GROUP\"

class ThreadsController extends GetxController {
  TextEditingController newThreadTC = TextEditingController();
  bool initial = true;
  String selectedThread = 'GENERAL_OUTREACH';
  List<ThreadModel> threadData = [];
  Map<String, String> threadTypes = {
    'Job Specific': "JOB_SPECIFIC",
    'General Outreach': "GENERAL_OUTREACH",
    'Internal Team': "INTERNAL_TEAM",
    'ORG Group': "ORG_GROUP",
  };
  String selectedType = '';
  changeType(String val){
    selectedType = threadTypes[val]!;
  }

  getThreads() async {
    try {
      initial = false;
      var response = await MessageApiServices.getThreads();
      threadData = [];
      for (var thread in response['threads']) {
        threadData.add(ThreadModel.fromJson(thread));
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
