import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';

class ResetSettingsDialog extends StatelessWidget {
  const ResetSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: WhiteCurvedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Reset Job Settings to Default?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close, size: 25),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'This will restore all job settings to their original defaults. Are you sure you want to reset job settings to default?',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ActionButton(
                        inverted: true,
                        noBorder: true,
                        width: 70,
                        buttonText: 'Cancel',
                        onPress: () {
                          Get.back();
                        },
                      ),
                      SizedBox(width: 10),
                      ActionButton(
                        width: 110,
                        buttonText: 'Reset Settings',
                        onPress: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
