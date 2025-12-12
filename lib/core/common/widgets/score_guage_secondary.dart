import 'package:flutter/material.dart';

/// A custom widget that displays a score (0-100) inside a circular progress gauge.
class ScoreGaugeSecondary extends StatelessWidget {
  final int score;
  final double size;
  final double strokeWidth;
  final Color baseColor;
  final Color progressColor;

  const ScoreGaugeSecondary({
    super.key,
    required this.score,
    this.size = 30.0, // Default size for the entire widget
    this.strokeWidth = 2.5,
    this.baseColor = const Color(0xFFC8E6C9), // Light green background
    this.progressColor = const Color(0xFF4CAF50), // Green for progress
  }) : assert(score >= 0 && score <= 100, 'Score must be between 0 and 100.');

  @override
  Widget build(BuildContext context) {
    // Calculate the normalized sweep angle (0.0 to 2 * pi)
    final double sweepAngle = (score / 100) * 2 * 3.1415926535;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: size + 5, // Give a little extra width for the label
        height: size + 10, // Give extra height for the label
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: CustomPaint(
                painter: _CircularGaugePainter(
                  baseColor: baseColor,
                  progressColor: progressColor,
                  strokeWidth: strokeWidth,
                  sweepAngle: sweepAngle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// CustomPainter to draw the circular gauge.
class _CircularGaugePainter extends CustomPainter {
  final Color baseColor;
  final Color progressColor;
  final double strokeWidth;
  final double sweepAngle;

  _CircularGaugePainter({
    required this.baseColor,
    required this.progressColor,
    required this.strokeWidth,
    required this.sweepAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define the center and radius
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = (size.width - strokeWidth) / 2;

    // --- 1. Draw the Base Circle (unfilled track) ---
    final Paint basePaint = Paint()
      ..color = baseColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, basePaint);

    // --- 2. Draw the Progress Arc (filled portion) ---
    final Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // The bounding box for the arc
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    // Draw the arc starting at 12 o'clock (-pi/2 radians)
    canvas.drawArc(
      rect,
      -3.1415926535 / 2, // Start angle (12 o'clock)
      sweepAngle,
      false, // Do not use center
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularGaugePainter oldDelegate) {
    // Only repaint if the core values have changed
    return oldDelegate.sweepAngle != sweepAngle ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.baseColor != baseColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
