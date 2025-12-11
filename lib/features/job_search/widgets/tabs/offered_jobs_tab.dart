import 'package:flutter/material.dart';
import 'package:job_seeker/features/job_search/widgets/no_job_found_message.dart';

class OfferedJobsTab extends StatelessWidget {
  const OfferedJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return NoJobFoundMessage(
      title: 'No job offers yet',
      subTitle:
      'When a recruiter extends a job offer to you, it will appear here for your review and response. ',
    );
  }
}
