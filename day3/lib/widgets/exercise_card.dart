import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Exercise Card widget preserving all UI layout, typography, and card constraints,
/// with the exact 3-ring concentric progress indicator matching user specifications.
class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFBFC),
        borderRadius: BorderRadius.circular(32.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 12.0,
            offset: Offset(0, 4),
          ),
        ],
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
                    style: GoogleFonts.inter(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF111111),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 3.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F5F7),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      '1/8',
                      style: GoogleFonts.inter(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF111111),
                      ),
                    ),
                  ),
                ],
              ),

              // "1:29:59" Timer text
              Text(
                '1:29:59',
                style: GoogleFonts.inter(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                  color: const Color(0xFF111111),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18.0),

          // ── Central 3-Ring Gauge Image Asset ──────────────────────────────
          Center(
            child: Image.asset(
              'assets/images/progress_ring.png',
              width: 180.0,
              height: 180.0,
              fit: BoxFit.contain,
              colorBlendMode: BlendMode.multiply,
            ),
          ),

          const SizedBox(height: 18.0),

          // ── Metrics Row: VO2 29 | Dots | Heart 98 ───────────────────────
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
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF111111),
                      ),
                    ),
                    TextSpan(
                      text: '₂',
                      style: GoogleFonts.inter(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF111111),
                      ),
                    ),
                    TextSpan(
                      text: ' 29',
                      style: GoogleFonts.inter(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
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
                  const SizedBox(width: 5.0),
                  Container(
                    width: 14.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF111111),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                  const SizedBox(width: 5.0),
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
                    size: 18.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '98',
                    style: GoogleFonts.inter(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF111111),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16.0),

          // ── Bottom Pill Button: STOP ──────────────────────────────────────
          Container(
            width: double.infinity,
            height: 46.0,
            decoration: BoxDecoration(
              color: const Color(0xFFFAC6B7),
              borderRadius: BorderRadius.circular(23.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _StopSymbolIcon(size: 16.0),
                const SizedBox(width: 6.0),
                Text(
                  'STOP',
                  style: GoogleFonts.inter(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                    color: const Color(0xFF111111),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter rendering exact 3-ring concentric progress indicator matching reference sample image.
class _GaugeRingsPainter extends CustomPainter {
  const _GaugeRingsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final double center = size.width / 2;
    final Offset c = Offset(center, center);

    const double outerRadius = 78.0;
    const double middleRadius = 62.0;
    const double innerRadius = 46.0;

    const double outerStrokeWidth = 8.0;
    const double middleStrokeWidth = 8.0;
    const double innerStrokeWidth = 3.5;

    const Color grayTrackColor = Color(0xFFEFF2F4);

    // ── 1. Inner Ring: Thin light gray complete circle ─────────────────────────
    final Paint innerRingPaint = Paint()
      ..color = const Color(0xFFE8EDF0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = innerStrokeWidth;
    canvas.drawCircle(c, innerRadius, innerRingPaint);

    // ── 2. Middle Ring: Full Light Gray Track + Light Blue Arc ────────────────
    final Rect middleRect = Rect.fromCircle(center: c, radius: middleRadius);

    // Full light gray background track for middle ring
    final Paint middleTrackPaint = Paint()
      ..color = grayTrackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = middleStrokeWidth;
    canvas.drawCircle(c, middleRadius, middleTrackPaint);

    // Light Blue Arc: Starts at ~12:15 o'clock (-82°), wraps left & bottom to ~5:30 o'clock (75°), sweep -203°
    const double blueStart = -82.0 * math.pi / 180.0;
    const double blueSweep = -203.0 * math.pi / 180.0;
    final Paint bluePaint = Paint()
      ..color = const Color(0xFFCBEBFA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = middleStrokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(middleRect, blueStart, blueSweep, false, bluePaint);

    // ── 3. Outer Ring: Full Light Gray Track + Green-to-Orange Arc + Green Tip Dot ──
    final Rect outerRect = Rect.fromCircle(center: c, radius: outerRadius);

    // Full light gray background track for outer ring
    final Paint outerTrackPaint = Paint()
      ..color = grayTrackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerStrokeWidth;
    canvas.drawCircle(c, outerRadius, outerTrackPaint);

    // Outer Gradient Arc: Starts at ~1:20 o'clock (-52°), ends at ~5:00 o'clock (68°), sweep 120°
    const double outerStart = -52.0 * math.pi / 180.0;
    const double outerSweep = 120.0 * math.pi / 180.0;

    const Gradient outerGradient = SweepGradient(
      startAngle: outerStart,
      endAngle: outerStart + outerSweep,
      colors: [
        Color(0xFF8DC63F), // Vibrant green at top
        Color(0xFFB5D335), // Smooth green-yellow transition
        Color(0xFFE59819), // Golden orange at bottom
      ],
      stops: [0.0, 0.35, 1.0],
    );

    final Paint outerArcPaint = Paint()
      ..shader = outerGradient.createShader(outerRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerStrokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(outerRect, outerStart, outerSweep, false, outerArcPaint);

    // Green circular dot at the top tip of the outer arc (at ~1:20 o'clock / -52°)
    final Offset dotCenter = Offset(
      c.dx + outerRadius * math.cos(outerStart),
      c.dy + outerRadius * math.sin(outerStart),
    );

    final Paint greenDotPaint = Paint()
      ..color = const Color(0xFF8DC63F)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(dotCenter, outerStrokeWidth / 2 + 1.0, greenDotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Custom painted icon for STOP symbol (Circle outline with inner filled square).
class _StopSymbolIcon extends StatelessWidget {
  final double size;

  const _StopSymbolIcon({this.size = 16.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _StopSymbolPainter(),
      ),
    );
  }
}

class _StopSymbolPainter extends CustomPainter {
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
