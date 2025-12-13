import 'package:flutter/material.dart';

class ProgressMeterWidget extends StatelessWidget {
  final int currentValue; // The value that determines the fill level (e.g., 3)
  final double minValue;     // The start of the range (e.g., 1)
  final double maxValue;     // The end of the range (e.g., 6)
  final Color filledColor;
  final Color unfilledColor;
  final double height;
  final double radius;

  const ProgressMeterWidget({
    super.key,
    required this.currentValue,
    this.minValue = 0.0, // Default to 0, common for ranges
    required this.maxValue,
    this.filledColor = Colors.green,
    this.unfilledColor = const Color(0xFFEEEEEE),
    this.height = 6.0,
    this.radius = 10.0,
  }) : assert(minValue < maxValue, 'minValue must be less than maxValue');

  @override
  Widget build(BuildContext context) {
    // 1. Calculate the normalized progress relative to the defined range.
    // Progress = (Current Value - Min Value) / (Max Value - Min Value)
    final double range = maxValue - minValue;
    final double progress = currentValue - minValue;

    // Clamp the percentage between 0.0 and 1.0 (0% to 100%)
    final double percentage = (range > 0) ? (progress / range).clamp(0.0, 1.0) : 0.0;

    //
    return LayoutBuilder(
      builder: (context, constraints) {
        final double totalWidth = constraints.maxWidth;
        final double filledWidth = totalWidth * percentage;

        return Container(
          height: height,
          width: totalWidth,
          decoration: BoxDecoration(
            color: unfilledColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: height,
              width: filledWidth,
              decoration: BoxDecoration(
                color: filledColor,
                // Apply radius to the left side always.
                // Apply radius to the right side only if it's 100% full.
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(radius),
                  right: (percentage >= 0.999)
                      ? Radius.circular(radius)
                      : Radius.zero,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}