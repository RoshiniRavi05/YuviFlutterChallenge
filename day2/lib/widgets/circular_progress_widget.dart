import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Circular progress gauge widget displaying progress percentage inside a styled ring.
class CircularProgressWidget extends StatelessWidget {
  final double progress;
  final String percentageText;
  final double size;

  const CircularProgressWidget({
    super.key,
    this.progress = 0.64,
    this.percentageText = '64%',
    this.size = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircularProgressPainter(
          progress: progress,
          trackColor: const Color(0xFFE8ECEF),
          progressColor: const Color(0xFF82BE3F),
          innerBgColor: const Color(0xFFF0F3F4),
          strokeWidth: 6.0,
        ),
        child: Center(
          child: Text(
            percentageText,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E2325),
              letterSpacing: -0.2,
            ),
          ),
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color trackColor;
  final Color progressColor;
  final Color innerBgColor;
  final double strokeWidth;

  _CircularProgressPainter({
    required this.progress,
    required this.trackColor,
    required this.progressColor,
    required this.innerBgColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Inner filled background circle
    final innerBgPaint = Paint()
      ..color = innerBgColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius - (strokeWidth / 2), innerBgPaint);

    // Background track ring
    final trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, trackPaint);

    // Progress arc starting at 12 o'clock (-90 degrees) rotating clockwise
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.progressColor != progressColor;
  }
}
