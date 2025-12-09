import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/form_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/features/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';

class BasicInfoTab extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  BasicInfoTab({super.key});

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
              'Basic Information',
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
                        const TextSpan(text: 'Full Name'),
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
                  InputField(
                    controller: homeController.nameFieldTC,
                    hintText: 'Enter name',
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        const TextSpan(text: 'Contact Email'),
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
                  InputField(
                    controller: homeController.emailFieldTC,
                    hintText: 'Enter email',
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        const TextSpan(text: 'Phone Number '),
                        const TextSpan(
                          text: '(optional)',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  InputField(
                    controller: homeController.emailFieldTC,
                    hintText: 'Enter email',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: FormButton(
                buttonText: 'Save Basic Information',
                onPress: () {},
                bwidth: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
