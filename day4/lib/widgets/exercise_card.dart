import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/typography.dart';

/// Exercise Card widget preserving all UI layout, typography, and card constraints,
/// with exact 3-ring vector progress indicator matching reference design.
class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key});

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

          // ── Central 3-Ring Gauge Image Asset ──────────────────────────────
          Center(
            child: Image.asset(
              'assets/images/progress_ring.png',
              width: 185.0,
              height: 185.0,
              fit: BoxFit.contain,
            ),
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
          Container(
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
