import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/form_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class ProfSumTab extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  ProfSumTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Professional Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            WhiteCurvedBox(
              margin: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // CircleAvatar(radius: 16,child: Container(color: Colors.red),),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        const TextSpan(text: 'Professional Summary'),
                        const TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: homeController.profSumTC,
                    maxLines: 7,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: const OutlineInputBorder(),
                      label: Text('Write a short summary about your professional background'),
                      labelStyle: TextStyle(color: Get.theme.colorScheme.tertiary,)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: FormButton(
                buttonText: 'Save Professional Summary',
                onPress: () {},
                bwidth: 190,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
