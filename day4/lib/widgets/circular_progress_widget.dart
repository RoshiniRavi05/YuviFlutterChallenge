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
    this.size = 58.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircularProgressPainter(
          progress: progress,
          trackColor: const Color(0xFFEDF0F2),
          progressColor: const Color(0xFF8EB74A),
          innerBgColor: const Color(0xFFE3E8EA),
          strokeWidth: 7.0,
        ),
        child: Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '64',
                  style: GoogleFonts.inter(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1E2325),
                    letterSpacing: -0.5,
                  ),
                ),
                TextSpan(
                  text: '%',
                  style: GoogleFonts.inter(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E2325),
                  ),
                ),
              ],
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

    // 1. Inner filled soft gray disc with padding gap
    final innerBgPaint = Paint()
      ..color = innerBgColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius - (strokeWidth / 2) - 2.5, innerBgPaint);

    // 2. Background track ring (#EDF0F2)
    final trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, trackPaint);

    // 3. Progress arc starting at ~4:20 o'clock (40°) sweeping 64% clockwise to ~11:55 o'clock
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = (40 * pi) / 180;
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
        oldDelegate.progressColor != progressColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
