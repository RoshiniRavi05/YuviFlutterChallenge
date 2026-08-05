import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/typography.dart';

/// Exercise Card widget preserving all UI layout, typography, and card constraints,
/// with exact 3-ring vector progress indicator matching reference design.
class ExerciseCard extends StatelessWidget {
  final VoidCallback? onStopPressed;

  const ExerciseCard({
    super.key,
    this.onStopPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(32.0),
        border: Border.all(
          color: const Color(0xFFF0EFF2),
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top Header Row ──────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // "Exercise" title & "1/8" pill badge
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Exercise',
                    style: AppTypography.exerciseTitle,
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9.0,
                      vertical: 3.5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F2F5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      '1/8',
                      style: AppTypography.exerciseBadge,
                    ),
                  ),
                ],
              ),

              // "1:29:59" Timer text
              Text(
                '1:29:59',
                style: AppTypography.timerText,
              ),
            ],
          ),

          const SizedBox(height: 16.0),

          // ── Central 3-Ring Gauge Vector Component ────────────────────────
          const Center(
            child: _CircularProgressGauge(size: 195.0),
          ),

          const SizedBox(height: 14.0),

          // ── Metrics Row: VO2 29 | Carousel Dots | Heart 98 ────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left: VO₂ 29
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'VO',
                      style: GoogleFonts.inter(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF111111),
                      ),
                    ),
                    TextSpan(
                      text: '₂',
                      style: GoogleFonts.inter(
                        fontSize: 9.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF111111),
                      ),
                    ),
                    TextSpan(
                      text: ' 29',
                      style: GoogleFonts.inter(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF111111),
                      ),
                    ),
                  ],
                ),
              ),

              // Center: Carousel Dots (Dot, Active Pill, Dot)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 4.0,
                    height: 4.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE2E7EA),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Container(
                    width: 14.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF111111),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Container(
                    width: 4.0,
                    height: 4.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE2E7EA),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),

              // Right: Peach Heart 98
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_rounded,
                    color: Color(0xFFF5AA92),
                    size: 16.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '98',
                    style: GoogleFonts.inter(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF111111),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14.0),

          // ── Bottom Pill Button: STOP ──────────────────────────────────────
          GestureDetector(
            onTap: onStopPressed,
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: double.infinity,
              height: 44.0,
              decoration: BoxDecoration(
                color: const Color(0xFFF8BFAC),
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _StopSymbolIcon(size: 14.0),
                  const SizedBox(width: 6.0),
                  Text(
                    'STOP',
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: const Color(0xFF111111),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painted icon for STOP symbol (Circle outline with inner filled square).
class _StopSymbolIcon extends StatelessWidget {
  final double size;

  const _StopSymbolIcon({this.size = 14.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CustomPaint(
        painter: _StopSymbolPainter(),
      ),
    );
  }
}

class _StopSymbolPainter extends CustomPainter {
  const _StopSymbolPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final double center = size.width / 2;
    final Offset c = Offset(center, center);
    final double radius = (size.width - 2.0) / 2;

    // Outer circle outline
    final Paint circlePaint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(c, radius, circlePaint);

    // Inner filled square
    final double squareSize = size.width * 0.36;
    final Rect squareRect = Rect.fromCenter(
      center: c,
      width: squareSize,
      height: squareSize,
    );
    final Paint squarePaint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(squareRect, const Radius.circular(1.2)),
      squarePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Pixel-perfect 4-layer circular progress gauge component matching reference UI.
class _CircularProgressGauge extends StatelessWidget {
  final double size;

  const _CircularProgressGauge({
    this.size = 190.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Concentric circular gauge rings (CustomPainter)
          const Positioned.fill(
            child: CustomPaint(
              painter: _GaugeRingsPainter(),
            ),
          ),

          // LAYER 1: Centered Content Column (Black Circle + Running + 10km)
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Black Center Circle (44px) with peach running icon & max breathing room
              Container(
                width: 44.0,
                height: 44.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF000000),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.directions_run_rounded,
                    color: Color(0xFFFFD7C8),
                    size: 15.5,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // "Running" label
              Text(
                'Running',
                style: GoogleFonts.inter(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF5E5E5E),
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 2.0),
              // "10km" value
              Text(
                '10km',
                style: GoogleFonts.inter(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF111111),
                  letterSpacing: -0.4,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GaugeRingsPainter extends CustomPainter {
  const _GaugeRingsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double center = w / 2;
    final Offset c = Offset(center, center);

    // ── 1. INNER BLUE PROGRESS RING ──────────────────────────────────────────
    final double r2 = w * 0.335;
    const double t2 = 8.5;
    final Rect rect2 = Rect.fromCircle(center: c, radius: r2);

    // Continuous light gray background track (#F0F3F6) so zero white space exists near blue caps
    final Paint innerGrayTrackPaint = Paint()
      ..color = const Color(0xFFF0F3F6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = t2
      ..isAntiAlias = true;

    canvas.drawCircle(c, r2, innerGrayTrackPaint);

    // Light Pastel Blue (#D7F4FF) progress segment starting at 4:00 o'clock (30 deg) and ending at 12:00 (270 deg)
    const double startAngle2A = math.pi * 0.1667; // 4:00 position (30 deg)
    const double sweepAngle2A = math.pi * 1.3333; // 240 deg sweep ending at 12:00 (270 deg)

    final Paint bluePaint = Paint()
      ..color = const Color(0xFFD7F4FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = t2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawArc(rect2, startAngle2A, sweepAngle2A, false, bluePaint);

    // ── 2. MIDDLE GREY RING ──────────────────────────────────────────────────
    // Complete circular grey ring with solid prominent stroke thickness (~9.5px)
    final double r3 = w * 0.400;
    const double t3 = 9.5;
    final Paint grayTrackPaint = Paint()
      ..color = const Color(0xFFEEEEEE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = t3
      ..isAntiAlias = true;

    canvas.drawCircle(c, r3, grayTrackPaint);

    // ── 3. RIGHT GRADIENT ARC (2:30 to 5:00 with Attached Green Dot) ────────
    final double r4 = w * 0.460;
    const double t4 = 8.0;
    final Rect rect4 = Rect.fromCircle(center: c, radius: r4);

    const double startAngle4 = -math.pi * 0.0833; // 2:30 position (-15 deg)
    const double sweepAngle4 = math.pi * 0.4167;  // 75 deg sweep ending at 5:00 (+60 deg)

    final Paint activityPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = t4
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // 11-step HSL interpolated gradient for 100% continuous, ultra-smooth color flow
    const Gradient activityGradient = SweepGradient(
      center: Alignment.center,
      startAngle: startAngle4,
      endAngle: startAngle4 + sweepAngle4,
      colors: [
        Color(0xFF8EC045), // Leaf Green
        Color(0xFF91C142), // Green Step 1
        Color(0xFF98C13F), // Green Step 2
        Color(0xFFA3C13A), // Lime Green
        Color(0xFFB0C034), // Lime Yellow
        Color(0xFFBEBE2F), // Olive Yellow
        Color(0xFFCCB829), // Gold
        Color(0xFFD7AD22), // Golden Amber
        Color(0xFFDF9E1D), // Amber Orange
        Color(0xFFE48D1A), // Warm Orange
        Color(0xFFE77717), // Rich Orange
      ],
      stops: [
        0.00,
        0.10,
        0.20,
        0.30,
        0.40,
        0.50,
        0.60,
        0.70,
        0.80,
        0.90,
        1.00,
      ],
    );

    activityPaint.shader = activityGradient.createShader(rect4);
    canvas.drawArc(rect4, startAngle4, sweepAngle4, false, activityPaint);

    // Green Dot attached perfectly at the TOP endpoint of the colored arc (1:30 position)
    final double dotX = center + r4 * math.cos(startAngle4);
    final double dotY = center + r4 * math.sin(startAngle4);

    final Paint greenDotPaint = Paint()
      ..color = const Color(0xFF8EC045)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawCircle(Offset(dotX, dotY), 4.5, greenDotPaint);

    // ── 4. LEFT GREY QUARTER ARC ─────────────────────────────────────────────
    // Starts at 6:30 o'clock position (105 deg) and ends at 9:00 o'clock position (180 deg)
    const double startAngle5 = math.pi * 0.583; // 6:30 position (105 deg)
    const double sweepAngle5 = math.pi * 0.417; // 75 deg sweep ending at 9:00 (180 deg)

    final Paint outerLeftGrayPaint = Paint()
      ..color = const Color(0xFFEBEBEB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = t4
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawArc(rect4, startAngle5, sweepAngle5, false, outerLeftGrayPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
