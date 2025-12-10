import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/widgets/generate_cover_letter_options.dart';

class CreateCoverLetterMessage extends StatelessWidget {
  const CreateCoverLetterMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.45,
          height: 200,
          child: InkWell(
            onTap: (){
              Get.dialog(GenerateCoverLetterOptions());
            },
            child: WhiteCurvedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  SizedBox(height: 5),
                  Text(
                    'Create new cover letter',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
