import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/features/job_search/widgets/job_tile.dart';
// import 'package:job_seeker/features/job_search/widgets/no_job_found_message.dart';

class SavedJobsTab extends StatelessWidget {
  const SavedJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return JobTile(
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
      isDeletable: true,
      onIconTap: (){},
      onTileTap: (){},
    );



    // return NoJobFoundMessage(
    //   title: 'You haven’t saved any jobs yet',
    //   subTitle:
    //       'Bookmark jobs you’re interested in so you can review and apply later.',
    // );
  }
}
