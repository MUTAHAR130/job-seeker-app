import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/icons/app_icons.dart';
import 'package:job_seeker/features/job_search/widgets/job_tile.dart';
// import 'package:job_seeker/features/job_search/widgets/no_job_found_message.dart';

class InterviewedJobs extends StatelessWidget {
  const InterviewedJobs({super.key});

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
      defaultValue: 'INTERVIEWED',
      onIconTap: (){},
      onTileTap: (){},
    );

    // return NoJobFoundMessage(
    //   title: 'No interviews scheduled',
    //   subTitle:
    //   'When a recruiter moves you forward, your interviews will show up here.',
    // );
  }
}
