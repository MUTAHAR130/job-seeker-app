import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/widgets/create_resume_message.dart';
import 'package:job_seeker/features/home/widgets/home_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: HomeDrawer(),
        appBar: AppBar(
          // actions: [],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 5),
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Get.theme.hintColor,
                dividerColor: Colors.transparent,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0),
                  insets: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.start,

                tabs: const [
                  Tab(text: "Resumes"),
                  Tab(text: "Cover Letter"),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  CreateResumeMessage(),
                  const Center(child: Text('Cover Letter List Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
