import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

/// Custom-painted vector 3-ring circular progress gauge matching reference design.
class CircularProgressGauge extends StatelessWidget {
  final double size;

  const CircularProgressGauge({
    super.key,
    this.size = 175.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 1. Outer Vector Rings Custom Painter
          CustomPaint(
            size: Size(size, size),
            painter: const _GaugeRingsPainter(),
          ),

          // 2. Center Content: Inner Black Circle (with Running Icon) + Text Below
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12.0),
              // Inner Solid Black Circle (62x62) with Running Person Icon
              Container(
                width: 62.0,
                height: 62.0,
                decoration: const BoxDecoration(
                  color: AppColors.textDark,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: _RunningPersonIcon(
                    size: 20.0,
                    color: AppColors.heartPeach,
                  ),
                ),
              ),

              const SizedBox(height: 6.0),

              // "Running" Subtitle Label
              Text(
                'Running',
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGray,
                  height: 1.0,
                ),
              ),

              const SizedBox(height: 2.0),

              // "10km" Hero Distance Text
              Text(
                '10km',
                style: GoogleFonts.inter(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                  letterSpacing: -0.5,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Custom painter for rendering the multi-ring gauge arcs and accent green endpoint dot.
class _GaugeRingsPainter extends CustomPainter {
  const _GaugeRingsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final double center = size.width / 2;
    final Offset c = Offset(center, center);

    // Radii for outer and inner ring tracks
    final double outerRadius = size.width * 0.44;
    final double innerRadius = size.width * 0.38;

    // ── 1. Muted Background Track Rings ──────────────────────────────────────
    final Paint bgTrackPaint = Paint()
      ..color = const Color(0xFFECEEEF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;

    // Outer track circle
    canvas.drawCircle(c, outerRadius, bgTrackPaint);
    // Inner track circle
    canvas.drawCircle(c, innerRadius, bgTrackPaint);

    // ── 2. Outer Light Blue Arc Track ───────────────────────────────────────
    final Paint blueArcPaint = Paint()
      ..color = AppColors.accentBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    const double startAngleBlue = (-150 * math.pi) / 180; // ~10 o'clock
    const double sweepAngleBlue = (205 * math.pi) / 180; // sweeps clockwise to ~5 o'clock

    canvas.drawArc(
      Rect.fromCircle(center: c, radius: outerRadius),
      startAngleBlue,
      sweepAngleBlue,
      false,
      blueArcPaint,
    );

    // ── 3. Inner Yellow / Orange Accent Arc Track ────────────────────────────
    final Paint orangeArcPaint = Paint()
      ..color = const Color(0xFFDF9A26)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    const double startAngleOrange = (-20 * math.pi) / 180; // ~1 o'clock
    const double sweepAngleOrange = (140 * math.pi) / 180; // sweeps down to ~5:30 o'clock

    canvas.drawArc(
      Rect.fromCircle(center: c, radius: innerRadius),
      startAngleOrange,
      sweepAngleOrange,
      false,
      orangeArcPaint,
    );

    // ── 4. Accent Green Endpoint Dot at Upper Tip of Orange Arc ─────────────
    final double greenDotX = c.dx + innerRadius * math.cos(startAngleOrange);
    final double greenDotY = c.dy + innerRadius * math.sin(startAngleOrange);

    final Paint greenDotPaint = Paint()
      ..color = AppColors.accentGreen
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(greenDotX, greenDotY), 3.5, greenDotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Custom vector icon painter for the running person silhouette.
class _RunningPersonIcon extends StatelessWidget {
  final double size;
  final Color color;

  const _RunningPersonIcon({
    this.size = 20.0,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RunningPersonPainter(color: color),
      ),
    );
  }
}

class _RunningPersonPainter extends CustomPainter {
  final Color color;

  const _RunningPersonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final Paint strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final double s = size.width / 24.0;

    // Head
    canvas.drawCircle(Offset(13.5 * s, 4.5 * s), 2.0 * s, fillPaint);

    // Torso & Limbs
    final Path bodyPath = Path();
    bodyPath.moveTo(11.5 * s, 8.0 * s);
    bodyPath.lineTo(14.0 * s, 12.0 * s);
    bodyPath.moveTo(13.0 * s, 11.0 * s);
    bodyPath.lineTo(9.0 * s, 15.0 * s);
    bodyPath.lineTo(7.5 * s, 19.5 * s);
    bodyPath.moveTo(14.0 * s, 12.0 * s);
    bodyPath.lineTo(17.5 * s, 15.5 * s);
    bodyPath.lineTo(16.5 * s, 19.5 * s);
    bodyPath.moveTo(12.0 * s, 9.0 * s);
    bodyPath.lineTo(8.5 * s, 11.5 * s);
    bodyPath.lineTo(7.0 * s, 10.0 * s);
    bodyPath.moveTo(12.5 * s, 9.0 * s);
    bodyPath.lineTo(16.0 * s, 9.5 * s);
    bodyPath.lineTo(18.0 * s, 12.0 * s);

    canvas.drawPath(bodyPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _RunningPersonPainter oldDelegate) =>
      oldDelegate.color != color;
}
