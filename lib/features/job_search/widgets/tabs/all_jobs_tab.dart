import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/core/routes/app_routes.dart';
import 'package:job_seeker/features/job_search/widgets/job_tile.dart';
import 'package:get/get.dart';

class AllJobsTab extends StatelessWidget {
  const AllJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //jobs list view builder here
        JobTile(
          jobCondition: AppIcons.newIcon,
          jobTitle: 'UI/UX Designer',
          jobSalary: 'Competitive Package',
          bookMarked: false,
          companyLogo: AppIcons.googleIconSvg,
          companyName: 'Google',
          companyLocation: 'Los Angeles, California, US',
          workHourType: AppIcons.fullTimeIcon,
          workLocation: AppIcons.onSiteIcon,
          datePosted: DateTime.now(),
          onIconTap: () {},
          onTileTap: () {
            Get.toNamed(AppRoutes.jobDetailView);
          },
        ),
        Divider(thickness: 1, color: Get.theme.dividerColor),
        JobTile(
          jobCondition: AppIcons.expiringSoonIcon,
          jobTitle: 'UI/UX Designer',
          jobSalary: 'Competitive Package',
          bookMarked: true,
          companyLogo: AppIcons.googleIconSvg,
          companyName: 'Google',
          companyLocation: 'Los Angeles, California, US',
          workHourType: AppIcons.fullTimeIcon,
          workLocation: AppIcons.onSiteIcon,
          datePosted: DateTime(2025, 9, 2),
          onIconTap: () {},
          onTileTap: () {},
        ),
      ],
    );

    //shown when no items in the list
    // return NoJobFoundMessage(
    //   title: 'No jobs found right now',
    //   subTitle:
    //   'We couldn’t find any jobs matching your filters. Try adjusting your search or filters to see more opportunities.',
    // );
  }
}
