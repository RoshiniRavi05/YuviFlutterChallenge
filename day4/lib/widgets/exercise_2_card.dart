import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Standalone "Exercise 2/8" progress card widget matching reference UI.
class Exercise2Card extends StatelessWidget {
  const Exercise2Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(32.0),
        border: Border.all(
          color: const Color(0xFFF2F2F2),
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header Row: Title, Badge, 3-Dot Icon ─────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left: "Exercise" label & "2/8" pill badge
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
                      horizontal: 10.0,
                      vertical: 3.5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      '2/8',
                      style: GoogleFonts.inter(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF111111),
                      ),
                    ),
                  ),
                ],
              ),

              // Right: Horizontal 3-Dot Icon
              const _ThreeDotsIcon(size: 18.0),
            ],
          ),

          const SizedBox(height: 14.0),

          // ── Bottom Content Row: Perfectly Spaced & Balanced ─────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section 1: Dumbbell Icon Circle (40x40 Light Cyan Circle)
              const _DumbbellIcon(size: 40.0),

              // Section 2: Bench Press Column ("Bench Press", "3/10 ▲ 6%")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Bench Press',
                    style: GoogleFonts.inter(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF707070),
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '3/10',
                        style: GoogleFonts.inter(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF111111),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6.0,
                          vertical: 2.5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomPaint(
                              size: Size(6.0, 6.0),
                              painter: _UpwardTrianglePainter(
                                color: Color(0xFF88B739),
                              ),
                            ),
                            const SizedBox(width: 3.0),
                            Text(
                              '6%',
                              style: GoogleFonts.inter(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF555555),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Section 3: Time Column ("Time", "4min")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Time',
                    style: GoogleFonts.inter(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF707070),
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    '4min',
                    style: GoogleFonts.inter(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111111),
                    ),
                  ),
                ],
              ),

              // Section 4: Play Button (40x40 White Circle with 1.8px Black Border)
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF111111),
                    width: 1.8,
                  ),
                ),
                alignment: Alignment.center,
                child: const _PlayTriangleIcon(size: 13.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ThreeDotsIcon extends StatelessWidget {
  final double size;

  const _ThreeDotsIcon({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ThreeDotsPainter(),
      ),
    );
  }
}

class _ThreeDotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.fill;

    final double cy = size.height / 2;
    const double radius = 1.4;
    const double spacing = 5.0;
    final double startX = (size.width - (spacing * 2)) / 2;

    canvas.drawCircle(Offset(startX, cy), radius, fillPaint);
    canvas.drawCircle(Offset(startX + spacing, cy), radius, fillPaint);
    canvas.drawCircle(Offset(startX + (spacing * 2), cy), radius, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DumbbellIcon extends StatelessWidget {
  final double size;

  const _DumbbellIcon({this.size = 40.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFFCBEFFB),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: SizedBox(
        width: size * 0.54,
        height: size * 0.54,
        child: const CustomPaint(
          painter: _DumbbellVectorBadgePainter(),
        ),
      ),
    );
  }
}

class _DumbbellVectorBadgePainter extends CustomPainter {
  const _DumbbellVectorBadgePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.width / 24.0;

    final Paint paint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4 * s
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // 1. Central Bar extending through both ends
    canvas.drawLine(
      Offset(4.5 * s, 19.5 * s),
      Offset(19.5 * s, 4.5 * s),
      paint,
    );

    // 2. Bottom-Left Outer Plate (smaller disc)
    canvas.drawLine(
      Offset(4.8 * s, 14.2 * s),
      Offset(9.8 * s, 19.2 * s),
      paint,
    );

    // 3. Bottom-Left Inner Plate (larger disc)
    canvas.drawLine(
      Offset(6.2 * s, 11.2 * s),
      Offset(12.8 * s, 17.8 * s),
      paint,
    );

    // 4. Top-Right Inner Plate (larger disc)
    canvas.drawLine(
      Offset(11.2 * s, 6.2 * s),
      Offset(17.8 * s, 12.8 * s),
      paint,
    );

    // 5. Top-Right Outer Plate (smaller disc)
    canvas.drawLine(
      Offset(14.2 * s, 4.8 * s),
      Offset(19.2 * s, 9.8 * s),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}







class _UpwardTrianglePainter extends CustomPainter {
  final Color color;

  const _UpwardTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PlayTriangleIcon extends StatelessWidget {
  final double size;

  const _PlayTriangleIcon({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _PlayTrianglePainter(),
      ),
    );
  }
}

class _PlayTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.15);
    path.lineTo(size.width * 0.85, size.height * 0.50);
    path.lineTo(size.width * 0.25, size.height * 0.85);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
