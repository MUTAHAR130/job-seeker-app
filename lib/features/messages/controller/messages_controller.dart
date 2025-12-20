import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/messages/data/services/message_api_services.dart';
import 'package:job_seeker/features/messages/models/message_model.dart';

class MessagesController extends GetxController {
  TextEditingController sendMessageTC = TextEditingController();
  String selectedThread = '';
  bool initial = true;
  List<MessageModel> messageData = [];

  getMessages() async {
    try {
      initial = false;
      var response = await MessageApiServices.getMessages(selectedThread);
      messageData = [];
      for (var message in response['messages']) {
        messageData.add(MessageModel.fromJson(message));
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  sendMessage() async {
    try {
      var response = await MessageApiServices.sendMessage(
        selectedThread,
        sendMessageTC.text.trim(),
        [],
      );
      messageData.add(MessageModel.fromJson(response['message']));
      sendMessageTC.clear();
      update(['messageList']);
    } catch (e) {
      debugPrint('$e');
    }
  }
}
