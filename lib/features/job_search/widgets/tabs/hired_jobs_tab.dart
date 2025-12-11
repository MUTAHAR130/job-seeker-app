import 'package:flutter/material.dart';
import 'package:job_seeker/features/job_search/widgets/no_job_found_message.dart';

class HiredJobsTab extends StatelessWidget {
  const HiredJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return NoJobFoundMessage(
      title: 'You haven’t been hired yet',
      subTitle:
      'Once you accept a job offer and your hiring is confirmed, your new role details will appear here.',
    );
  }
}
