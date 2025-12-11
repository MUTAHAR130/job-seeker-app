import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/features/job_search/widgets/job_tile.dart';
// import 'package:job_seeker/features/job_search/widgets/no_job_found_message.dart';

class AppliedJobsTab extends StatelessWidget {
  const AppliedJobsTab({super.key});

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
      statusKnown: true,
      defaultValue: 'APPLIED',
      onIconTap: (){},
      onTileTap: (){},
    );



    // return NoJobFoundMessage(
    //   title: 'No applications submitted',
    //   subTitle:
    //       'Once you apply to a job, it will appear here so you can track your progress.',
    // );
  }
}
