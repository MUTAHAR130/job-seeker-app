import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/features/ai_interviews/controller/ai_interview_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/ai_interviews/widgets/dialogs/start_interview_dialog.dart';
import 'package:job_seeker/features/ai_interviews/widgets/saved_interview_widget.dart';

class AIInterviewsView extends StatelessWidget {
  final AIInterviewController aiInterviewController =
      Get.find<AIInterviewController>();

  AIInterviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ActionButton(
        width: MediaQuery.sizeOf(context).width * 0.85,
        buttonText: 'New Interview',
        onPress: () {
          Get.dialog(StartInterviewDialog());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI Interviews',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            SizedBox(height: 15),
            InputField(
              prefixIcon: Icons.search,
              controller: aiInterviewController.listSearchTC,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabeledDropDownMenu(
                  width: MediaQuery.sizeOf(context).width * 0.42,
                  items: [],
                  onChange: () {},
                  hintText: 'Exp. Level',
                ),
                SizedBox(width: 5),
                LabeledDropDownMenu(
                  width: MediaQuery.sizeOf(context).width * 0.42,
                  items: [],
                  onChange: () {},
                  hintText: 'All Status',
                ),
              ],
            ),
            SizedBox(height: 15),
            LabeledDropDownMenu(
              items: [],
              onChange: () {},
              hintText: 'Application Source',
            ),
            SizedBox(height: 15),
            //inside list view
            SavedInterviewWidget(),
          ],
        ),
      ),
    );
    // return StartInterviewMessage();
  }
}

