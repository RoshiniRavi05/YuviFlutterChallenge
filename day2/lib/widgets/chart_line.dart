import 'dart:ui';
import 'package:flutter/material.dart';

/// CustomPainter rendering the proportional bezier chart curve and active highlighted point marker.
class ChartLinePainter extends CustomPainter {
  final Color lineColor;
  final double strokeWidth;

  const ChartLinePainter({
    this.lineColor = const Color(0xFF389EB6),
    this.strokeWidth = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // 7 key proportional points representing graph behavior (S, M, T, W, T, F, S)
    final List<Offset> points = [
      Offset(0.0, height * 0.68),
      Offset(width * (1 / 6), height * 0.58),
      Offset(width * (2 / 6), height * 0.72),
      Offset(width * (3 / 6), height * 0.58),
      Offset(width * (4 / 6), height * 0.82), // Deep dip at Thursday
      Offset(width * (5 / 6), height * 0.22), // Highest peak at Friday
      Offset(width, height * 0.52),           // Gradual decline at Saturday
    ];

    // Smooth Bezier curve path
    final Path path = Path();
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final controlX = (p0.dx + p1.dx) / 2;
      path.cubicTo(controlX, p0.dy, controlX, p1.dy, p1.dx, p1.dy);
    }

    final Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, linePaint);

    // Active Point Marker: White outer circle + Black inner center (NO blue border/outline)
    // Selected point sits exactly on the curve at x = width * 0.73
    final Offset activePoint = _getPointOnPathAtX(path, width * 0.73);

    // Outer white circle
    final Paint outerDotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(activePoint, 5.5, outerDotPaint);

    // Inner black dot
    final Paint innerDotPaint = Paint()
      ..color = const Color(0xFF000000)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(activePoint, 2.8, innerDotPaint);
  }

  Offset _getPointOnPathAtX(Path path, double targetX) {
    final PathMetric metric = path.computeMetrics().first;
    double low = 0;
    double high = metric.length;
    Offset result = metric.getTangentForOffset(0)?.position ?? Offset.zero;

    for (int i = 0; i < 20; i++) {
      final double mid = (low + high) / 2;
      final Tangent? tangent = metric.getTangentForOffset(mid);
      if (tangent == null) break;
      result = tangent.position;
      if (result.dx < targetX) {
        low = mid;
      } else {
        high = mid;
      }
    }
    return result;
  }

  @override
  bool shouldRepaint(covariant ChartLinePainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
