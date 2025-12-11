import 'package:flutter/material.dart';
import 'package:job_seeker/features/job_search/widgets/no_job_found_message.dart';

class RejectedJobsTab extends StatelessWidget {
  const RejectedJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return NoJobFoundMessage(
      title: 'No rejections yet',
      subTitle:
          'This tab will show jobs where applications didn’t move forward. Keep going—every application is progress.',
    );
  }
}
