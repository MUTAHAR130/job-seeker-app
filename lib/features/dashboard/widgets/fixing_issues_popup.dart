import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';

class FixingIssuesPopup extends StatelessWidget {
  const FixingIssuesPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          height: 212,
          width: 224,
          child: WhiteCurvedBox(
            color: Get.theme.scaffoldBackgroundColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 101,
                    width: 102,
                    child: Image.asset('assets/images/magnify.gif'),
                  ),
                  Text(
                    'Fixing Issues',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
