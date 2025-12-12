import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/drop_down_menu.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/video_resumes/controller/generate_script_controller.dart';
import 'package:get/get.dart';

class GenerateScriptView extends StatelessWidget {
  final GenerateScriptController generateScriptController = Get.put(
    GenerateScriptController(),
  );

  GenerateScriptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'General Script',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputField(
                label: 'Script Title',
                mandatory: true,
                controller: generateScriptController.scriptTitleTC,
                hintText: 'Enter script title',
              ),
              SizedBox(height: 15),
              LabeledDropDownMenu(
                label: 'Script Type',
                mandatory: true,
                items: [],
                onChange: () {},
                hintText: 'Select script type',
              ),
              SizedBox(height: 15),
              LabeledDropDownMenu(
                label: 'Tone Preferences',
                mandatory: true,
                items: [],
                onChange: () {},
                hintText: 'Select tone preferences',
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF375668), Color(0xFF40C94E)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ActionButton(
                  noBorder: true,
                  noColor: true,
                  prefixIcon: AppIcons.aiSparkIcon,
                  buttonText: 'Generate Script with AI',
                  onPress: () {},
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Generated\nScript',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ActionButton(
                              width: 50,
                              height: 40,
                              inverted: true,
                              buttonText: 'Copy',
                              onPress: () {},
                            ),
                            SizedBox(width: 5),
                            ActionButton(
                              width: 80,
                              height: 40,
                              buttonText: 'Download',
                              onPress: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Text(
                      generateScriptController.generatedScriptDebug,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
