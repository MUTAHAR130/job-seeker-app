import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/routes/app_routes.dart';

class AnswerFeedbackWidget extends StatelessWidget {
  const AnswerFeedbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhiteCurvedBox(
          color: Colors.green.shade100,
          child: Row(
            children: [
              SvgPicture.string(AppIcons.feedbackIcon),
              SizedBox(width: 5),
              Text(
                'Answer Feedback',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        WhiteCurvedBox(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                WhiteCurvedBox(
                  color: Get.theme.scaffoldBackgroundColor,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        children: [
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
                                      '60%',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Good Answer',
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
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.watch_later_outlined),
                              Text(
                                ' Response Time: 8:43',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
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
                  color: Get.theme.listTileTheme.selectedTileColor,
                  borderColor: Get.theme.colorScheme.tertiary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI Feedback:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Good answer with solid foundation. There are some areas where you could strengthen your response by providing more specific examples or expanding on key points.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    SvgPicture.string(AppIcons.rateUpIcon),
                    SizedBox(width: 5),
                    Text(
                      'Strengths',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  horizontalTitleGap: 5,
                  leading: SvgPicture.string(AppIcons.checkMarkIcon),
                  title: Text(
                    'Answered the question directly',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    SvgPicture.string(AppIcons.rateDownIcon),
                    SizedBox(width: 5),
                    Text(
                      'Areas for Improvement',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  horizontalTitleGap: 5,
                  leading: SvgPicture.string(AppIcons.warningIcon),
                  title: Text(
                    'Consider taking more time to provide a thoughtful, detailed answer',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        ActionButton(buttonText: 'Next Question', onPress: () {
          Get.toNamed(AppRoutes.mockInterviewCompleteView);
        }),
      ],
    );
  }
}
