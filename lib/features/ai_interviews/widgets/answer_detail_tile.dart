import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/bubble_list_widget.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';

class AnswerDetailTile extends StatelessWidget {
  final int score;
  final int count;
  final String type;
  final String time;

  const AnswerDetailTile({
    super.key,
    required this.score,
    required this.count,
    required this.type,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          horizontalTitleGap: 0,
          leading: BubbleListWidget(
            text: type.toUpperCase(),
            onTap: () {},
            noOnTap: true,
          ),
          title: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(text: 'Question $count '),
                TextSpan(
                  text: time,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' $score%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: score < 40
                        ? Colors.red
                        : score >= 40 && score < 80
                        ? const Color(0xFFC9A240)
                        : Colors.green,
                  ),
                ),
              ],
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_down_rounded),
        ),
        Visibility(
          visible: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question $count',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                'If you could redesign one aspect of how Design operates, what would it be and why?',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(height: 15),
              Text(
                'Your Answer',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(height: 8),
              WhiteCurvedBox(
                color: Get.theme.scaffoldBackgroundColor,
                child: Text(
                  '''I’d enhance the handoff process between design and development. Often, valuable details get lost post-design approval.
Implementing a design QA system using automated tools like Zeplin or Storybook could reduce misalignment, speed up development, and maintain design fidelity. This small operational change can greatly improve product consistency and save engineering hours.''',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
              SizedBox(height: 15),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
        Divider(color: Get.theme.colorScheme.outline),
      ],
    );
  }
}
