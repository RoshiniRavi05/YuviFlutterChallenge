import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

/// WeeklyPointsCard component displaying progress, score, percentage gain tag, and smooth curve chart.
class WeeklyPointsCard extends StatelessWidget {
  /// Creates a [WeeklyPointsCard] instance.
  const WeeklyPointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE5E9EB), width: 1),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular progress gauge (64%)
              SizedBox(
                width: 56,
                height: 56,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 56,
                      height: 56,
                      child: CircularProgressIndicator(
                        value: 0.64,
                        strokeWidth: 6,
                        backgroundColor: const Color(0xFFE8ECEF),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF86B738),
                        ),
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Text(
                      '64%',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              // Weekly points info column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weekly points',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '1544',
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5EB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.arrow_drop_up,
                                color: Color(0xFF86B738),
                                size: 14,
                              ),
                              Text(
                                '6%',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF86B738),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Options menu icon
              const Icon(
                Icons.more_horiz,
                color: AppColors.text,
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Chart Container
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F8F8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: ChartPainter(),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) {
                    return Text(
                      day,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7E8E98),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// CustomPainter rendering vertical dashed lines, smooth bezier line chart, and active Thursday point dot.
class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // Draw vertical dashed gridlines for 7 days
    final Paint dashPaint = Paint()
      ..color = const Color(0xFFDCE2E5)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 7; i++) {
      final double x = (width / 6) * i;
      double startY = 0;
      while (startY < height) {
        canvas.drawLine(
          Offset(x, startY),
          Offset(x, startY + 4),
          dashPaint,
        );
        startY += 8;
      }
    }

    // Chart points matching mockup curve
    final List<Offset> points = [
      Offset(0, height * 0.70),
      Offset(width * 0.16, height * 0.65),
      Offset(width * 0.33, height * 0.60),
      Offset(width * 0.50, height * 0.85),
      Offset(width * 0.66, height * 0.20), // Peak at Thursday
      Offset(width * 0.83, height * 0.45),
      Offset(width, height * 0.50),
    ];

    final Path path = Path();
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final controlX = (p0.dx + p1.dx) / 2;
      path.cubicTo(controlX, p0.dy, controlX, p1.dy, p1.dx, p1.dy);
    }

    final Paint linePaint = Paint()
      ..color = const Color(0xFF389EB6)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, linePaint);

    // Thursday active point marker dot (at width * 0.66)
    final Offset activePoint = Offset(width * 0.66, height * 0.20);

    // Outer white circle
    final Paint outerDotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(activePoint, 8, outerDotPaint);

    // Border ring for outer dot
    final Paint borderDotPaint = Paint()
      ..color = const Color(0xFF389EB6)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(activePoint, 8, borderDotPaint);

    // Inner black dot
    final Paint innerDotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(activePoint, 3.5, innerDotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
