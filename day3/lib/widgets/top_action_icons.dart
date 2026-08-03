import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../constants/colors.dart';

/// Five-point outline star icon with smooth rounded corners matching reference screenshot.
class RoundedStarIcon extends StatelessWidget {
  final double size;
  final Color color;

  const RoundedStarIcon({
    super.key,
    this.size = 18.0,
    this.color = AppColors.textDark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RoundedStarPainter(color: color),
      ),
    );
  }
}

class _RoundedStarPainter extends CustomPainter {
  final Color color;

  const _RoundedStarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double outerR = size.width * 0.44;
    final double innerR = size.width * 0.21;

    final Path path = Path();
    const int numPoints = 5;
    const double angleStep = math.pi / numPoints;
    double angle = -math.pi / 2;

    List<Offset> points = [];
    for (int i = 0; i < numPoints * 2; i++) {
      final double r = (i % 2 == 0) ? outerR : innerR;
      points.add(Offset(
        cx + r * math.cos(angle),
        cy + r * math.sin(angle),
      ));
      angle += angleStep;
    }

    // Connect star points with smooth rounded joins
    path.moveTo((points[0].dx + points[1].dx) / 2, (points[0].dy + points[1].dy) / 2);
    for (int i = 0; i < points.length; i++) {
      final Offset p1 = points[i];
      final Offset p2 = points[(i + 1) % points.length];
      final Offset mid = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
      path.quadraticBezierTo(p1.dx, p1.dy, mid.dx, mid.dy);
    }
    path.close();

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _RoundedStarPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// Outline edit/pencil icon with rounded cap and horizontal underline stroke matching reference screenshot.
class EditPencilIcon extends StatelessWidget {
  final double size;
  final Color color;

  const EditPencilIcon({
    super.key,
    this.size = 18.0,
    this.color = AppColors.textDark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _EditPencilPainter(color: color),
      ),
    );
  }
}

class _EditPencilPainter extends CustomPainter {
  final Color color;

  const _EditPencilPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter
      ..isAntiAlias = true;

    final double w = size.width;
    final double h = size.height;

    // 1. Tilted Pencil body with sharp tip pointing down-left
    final Path pencilBody = Path();
    // Sharp tip point at bottom-left
    pencilBody.moveTo(w * 0.24, h * 0.68);
    // Upper side to top-right
    pencilBody.lineTo(w * 0.58, h * 0.18);
    // Rounded top eraser cap
    pencilBody.arcToPoint(
      Offset(w * 0.78, h * 0.38),
      radius: Radius.circular(w * 0.14),
      clockwise: true,
    );
    // Lower side line back to sharp tip
    pencilBody.lineTo(w * 0.44, h * 0.78);
    // Sharp tip vertex
    pencilBody.lineTo(w * 0.24, h * 0.68);
    pencilBody.close();

    canvas.drawPath(pencilBody, paint);

    // Eraser cap divider line
    canvas.drawLine(
      Offset(w * 0.48, h * 0.34),
      Offset(w * 0.68, h * 0.54),
      paint,
    );

    // 2. Horizontal Underline stroke below pencil tip
    canvas.drawLine(
      Offset(w * 0.18, h * 0.90),
      Offset(w * 0.82, h * 0.90),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _EditPencilPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// Three horizontal circular dots icon matching reference screenshot.
class MoreDotsIcon extends StatelessWidget {
  final double size;
  final Color color;

  const MoreDotsIcon({
    super.key,
    this.size = 18.0,
    this.color = AppColors.textDark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _MoreDotsPainter(color: color),
      ),
    );
  }
}

class _MoreDotsPainter extends CustomPainter {
  final Color color;

  const _MoreDotsPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final double cy = size.height * 0.52;
    const double radius = 1.4;
    final double spacing = size.width * 0.26;
    final double startX = size.width * 0.24;

    for (int i = 0; i < 3; i++) {
      canvas.drawCircle(Offset(startX + (i * spacing), cy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _MoreDotsPainter oldDelegate) =>
      oldDelegate.color != color;
}
