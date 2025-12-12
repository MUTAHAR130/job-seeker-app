import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/features/job_search/controller/jobs_controller.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/job_search/widgets/dialogs/apply_select_resume_dialog.dart';
import 'package:job_seeker/features/job_search/widgets/dialogs/interview_detail_dialog.dart';

class JobDetailView extends StatelessWidget {
  final JobController jobController = Get.find<JobController>();

  JobDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ActionButton(
        width: MediaQuery.sizeOf(context).width * 0.8,
        buttonText: 'Apply',
        onPress: () {
          Get.dialog(ApplySelectResumeDialog());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filters',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.dialog(InterviewDetailDialog());
                        },
                        child: Container(
                          height: 24,
                          width: 128,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Get.theme.colorScheme.surface,
                            border: BoxBorder.all(
                              color: Get.theme.colorScheme.outline,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'SHORTLISTED',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    'UI/UX Designer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Competitive Package',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 10),
                      SvgPicture.string(AppIcons.newIcon),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      SvgPicture.string(AppIcons.googleIconSvg),
                      Text(
                        'Google - Los Angeles, California, US',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.string(AppIcons.fullTimeIcon, height: 24),
                          SizedBox(width: 3),
                          SvgPicture.string(AppIcons.onSiteIcon, height: 24),
                        ],
                      ),
                      Text(
                        DateFormat('MMM dd yyyy').format(DateTime.now()),
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Department',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Design',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Experience level',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '3 years',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Application Deadline',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            DateFormat('MMM dd yyyy').format(DateTime.now()),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Skills',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  Text(
                    'UX Design, Design system, heuristics evaluation',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Job Overview',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    jobController.debugJobOverView,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Job Requirements:',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    jobController.debugJobReq,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
