import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/ai_interviews/widgets/answer_detail_tile.dart';
import 'package:job_seeker/features/ai_interviews/widgets/improvement_tile.dart';
import 'package:job_seeker/features/ai_interviews/widgets/score_meter_widget.dart';
import 'package:get/get.dart';

class MockInterviewCompleteView extends StatelessWidget {
  const MockInterviewCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Interview Complete',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'UX Designer at Design Studio\n- Completed on October 24, 2025 at 02:38 AM',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Overall Score',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Stack(
                          children: [
                            SizedBox(
                              height: 130,
                              width: 212,
                              child: Image.asset(
                                'assets/images/score_frame_2.png',
                              ),
                            ),
                            Positioned(
                              top: 40,
                              left: 70,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '75%',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Grade',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Avg Response Time',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 35),
                        Text(
                          '0m 27s',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'per question',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Questions Answered',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 35),
                        Text(
                          '6',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'total questions',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Performance by question type',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15),
                    ScoreMeterWidget(label: 'Behavioral', score: 70),
                    SizedBox(height: 15),
                    ScoreMeterWidget(label: 'Situational', score: 80),
                    SizedBox(height: 15),
                    ScoreMeterWidget(label: 'Technical', score: 20),
                    SizedBox(height: 15),
                    ScoreMeterWidget(label: 'Creative', score: 75),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                color: Get.theme.listTileTheme.selectedTileColor,
                borderColor: Get.theme.colorScheme.tertiary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.string(AppIcons.bookIcon),
                        Text(
                          'Improvement Summary',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ImprovementTile(
                          count: index + 1,
                          text:
                              'Good foundation, but work on providing more specific examples and quantifiable results',
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              WhiteCurvedBox(
                child: Column(
                  children: [
                    Text(
                      'Detailed Answer Review',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15),
                    AnswerDetailTile(
                      score: 70,
                      count: 1,
                      type: 'behavioral',
                      time: '0m 27s',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              ActionButton(
                buttonText: 'Back To Home',
                onPress: () {
                  Get.until((route) => route.settings.name == AppRoutes.home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
