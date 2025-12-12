import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/job_search/widgets/dialogs/offer_detail_dialog.dart';

class InterviewDetailDialog extends StatelessWidget {
  final bool? requestAccept;

  const InterviewDetailDialog({super.key, this.requestAccept});

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
                      Text(
                        'Interview Detail',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
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
                  SizedBox(height: requestAccept != null ? 15 : 0),
                  requestAccept != null
                      ? (requestAccept == true
                            ? Container(
                                padding: EdgeInsets.all(8),
                                height: 60,
                                decoration: BoxDecoration(
                                  color:
                                      Get.theme.listTileTheme.selectedTileColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: BoxBorder.all(
                                    color: Get.theme.colorScheme.tertiary,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.info_outline),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        'Rescheduling request has been sent to recruiter. Wait for recruiter’s response.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.all(8),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: BoxBorder.all(color: Colors.red),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.close),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        'Rescheduling request has been rejected by recruiter.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                      : SizedBox(),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: Get.theme.colorScheme.outline),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'UI/UX Design Candidates',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Physical',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(CupertinoIcons.clock),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                '12:00PM-1:00PM, 9-Oct-2025',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                'Floor # 3, Office # 301, Fortune Tower, In front of Times Consultant',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.people),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                'You, Jane Cooper, Michael Ford',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(CupertinoIcons.creditcard),
                            SizedBox(width: 5),
                            Text(
                              'Bring government ID',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  requestAccept == null ? ActionButton(
                    inverted: true,
                    buttonText: 'Reschedule Request',
                    onPress: () {
                      Get.back();
                      Get.dialog(OfferDetailDialog());
                    },
                  ) : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
