import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/white_curved_box.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/home/widgets/text_scale_tab.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart';

class FinalPreviewTab extends StatelessWidget {
  const FinalPreviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 342,
                width: double.infinity,
                child: SfPdfViewer.asset('assets/docs/Resume1.pdf'),
              ),
              SizedBox(height: 30),
              WhiteCurvedBox(
                margin: 24,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 130,
                          width: 212,
                          child: Image.asset('assets/images/score_frame.png'),
                        ),
                        Positioned(
                          top: 40,
                          left: 50,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '70%',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Needs Improvement',
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
                    SizedBox(height: 15),
                    ActionButton(
                      buttonText: 'Explore Resume Score',
                      onPress: () {Get.toNamed(AppRoutes.resumeScoreView);},
                    ),
                  ],
                ),
              ),
              TabBar(
                tabs: const [
                  Tab(text: 'Text'),
                  Tab(text: 'Colors'),
                ],
                unselectedLabelColor: Get.theme.colorScheme.tertiary,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Get.theme.colorScheme.tertiary,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                dividerColor: Colors.transparent,
              ),
              SizedBox(
                height: 400,
                child: TabBarView(
                  children: [
                    TextScaleTab(),
                    const Center(child: Text('Colors Tab Content')),
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
