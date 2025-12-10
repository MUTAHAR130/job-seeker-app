import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/features/home/widgets/home_drawer.dart';
import 'package:job_seeker/features/job/widgets/all_jobs_tab.dart';

class JobSearchView extends StatelessWidget {
  const JobSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 9,
    child: Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        // actions: [],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, top: 5),
          child: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Get.theme.hintColor,
            dividerColor: Colors.transparent,
            indicatorColor: Get.theme.colorScheme.surface,
            indicator: BoxDecoration(
              color: Get.theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8.0),
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
            tabAlignment: TabAlignment.start,

            tabs: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Tab(text: "All Jobs"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Tab(text: "Saved (0)"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Tab(text: "Applied (0)"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Tab(text: "Reviewed (0)"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Tab(text: "Shortlisted (0)"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Tab(text: "interviewed (0)"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Tab(text: "Offered (0)"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Tab(text: "hired (0)"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Tab(text: "Rejected (0)"),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TabBarView(
              children: [
                AllJobsTab(),
                Center(child: Text('Saved')),
                Center(child: Text('Applied')),
                Center(child: Text('Reviewed')),
                Center(child: Text('Shortlisted')),
                Center(child: Text('interviewed')),
                Center(child: Text('Offered')),
                Center(child: Text('hired')),
                Center(child: Text('Rejected')),
              ],
            ),
          ),
        ),
      ],),
    ));
  }
}
