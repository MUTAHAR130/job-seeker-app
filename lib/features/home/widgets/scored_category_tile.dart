import 'package:flutter/material.dart';
import 'package:job_seeker/core/common/widgets/score_guage.dart';
import 'package:get/get.dart';

class ScoredCategoryTile extends StatelessWidget {
  final int score;
  final String title;
  final bool isSelected;

  const ScoredCategoryTile({
    super.key,
    required this.title,
    required this.score,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: BoxBorder.all(
          color: isSelected
              ? Get.theme.colorScheme.onSurface
              : Get.theme.colorScheme.surface,
        ),
        color: Get.theme.colorScheme.surface,
      ),
      child: Center(
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ScoreGauge(score: score),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
