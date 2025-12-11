import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/common/widgets/action_button.dart';
import 'package:job_seeker/core/common/widgets/input_field.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/job_search/controller/jobs_controller.dart';
import 'package:job_seeker/features/job_search/widgets/tabs/all_jobs_tab.dart';
import 'package:job_seeker/features/job_search/widgets/tabs/applied_jobs_tab.dart';
import 'package:job_seeker/features/job_search/widgets/tabs/saved_jobs_tab.dart';

class JobSearchView extends StatelessWidget {
  final JobController jobController = Get.put(JobController());
  JobSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 9,
    child: Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, top: 5, right: 2),
          child: TabBar(
            splashFactory: NoSplash.splashFactory,
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
            child: Column(
              children: [
                SizedBox(height: 15),
                InputField(
                  controller: jobController.jobListingSearchTC,
                  prefixIcon: Icons.search,
                  hintText: 'Search Job Title',
                ),
                SizedBox(height: 15),
                InputField(
                  controller: jobController.jobListingLocationTC,
                  prefixIcon: Icons.location_on_outlined,
                  hintText: 'Search Location',
                ),
                SizedBox(height: 15),
                ActionButton(
                  buttonText: 'Filter',
                  inverted: true,
                  prefixIcon: AppIcons.sliderBarsIcon,
                  onPress: () {Get.toNamed(AppRoutes.jobFilterView);},
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TabBarView(
                      children: [
                        AllJobsTab(),
                        SavedJobsTab(),
                        AppliedJobsTab(),
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
              ],
            ),
          ),
        ),
      ],),
    ));
  }
}
