import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/bubble_list_widget.dart';
import 'package:job_seeker/core/common/widgets/progress_meter_widget.dart';

class ScoreMeterWidget extends StatelessWidget {
  final String label;
  final int score;

  const ScoreMeterWidget({super.key, required this.label, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            BubbleListWidget(text: '$score%', onTap: () {}, noOnTap: true),
          ],
        ),
        SizedBox(height: 8),
        ProgressMeterWidget(
          filledColor: score < 40
              ? Colors.red
              : score >= 40 && score < 80
              ? Color(0xFFC9A240)
              : Colors.green,
          currentValue: score,
          maxValue: 100,
        ),
      ],
    );
  }
}
