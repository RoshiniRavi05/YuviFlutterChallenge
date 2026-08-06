import 'dart:ui';
import 'package:flutter/material.dart';

/// CustomPainter rendering the exact proportional bezier chart curve extending past grid lines to edges.
class ChartLinePainter extends CustomPainter {
  final Color lineColor;
  final double strokeWidth;
  final double sidePadding;

  const ChartLinePainter({
    this.lineColor = const Color(0xFF3E9FC3),
    this.strokeWidth = 4.0,
    this.sidePadding = 34.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final double availableWidth = width - (2 * sidePadding);
    double dayX(double index) => sidePadding + (availableWidth / 6) * index;

    final List<Offset> points = [
      Offset(0.0, height * 0.64),                             // Starts low at far left edge
      Offset(dayX(0.0), height * 0.52),                        // Sunday rise
      Offset(dayX(0.7), height * 0.64),                        // Shallow Monday dip
      Offset(dayX(1.1), height * 0.58),                        // Ascending into Tuesday
      Offset(dayX(2.0), height * 0.44),                        // Tuesday hill (higher than Sunday)
      Offset(dayX(3.0), height * 0.70),                        // Wide, smooth Wednesday valley
      Offset(dayX(4.0), height * 0.40),                        // Continuous Thursday climb
      Offset(dayX(4.8), height * 0.18),                        // Broad Friday peak (taller & wider)
      Offset(dayX(5.1), height * 0.19),                        // Rounded top crest
      Offset(dayX(5.7), height * 0.36),                        // Smooth post-Friday descent
      Offset(dayX(6.0), height * 0.46),                        // Saturday descent
      Offset(width, height * 0.50),                            // Far right edge finish
    ];

    final Path path = Path();
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];

      final pPrev = i > 0 ? points[i - 1] : p0;
      final pNext = i < points.length - 2 ? points[i + 2] : p1;

      final cp1x = p0.dx + (p1.dx - pPrev.dx) * 0.22;
      final cp1y = p0.dy + (p1.dy - pPrev.dy) * 0.22;
      final cp2x = p1.dx - (pNext.dx - p0.dx) * 0.22;
      final cp2y = p1.dy - (pNext.dy - p0.dy) * 0.22;

      path.cubicTo(cp1x, cp1y, cp2x, cp2y, p1.dx, p1.dy);
    }

    final Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, linePaint);

    // Active Highlight Marker (10% smaller: 20px white / 7px black)
    // Perfectly centered on ascending stroke before Friday peak (~66% width)
    final double markerTargetX = sidePadding + (availableWidth * 0.66);
    final Offset activePoint = _getPointOnPathAtX(path, markerTargetX);

    // Outer white circle (20px diameter -> radius 10.0)
    final Paint outerDotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(activePoint, 10.0, outerDotPaint);

    // Inner black circle (7px diameter -> radius 3.5)
    final Paint innerDotPaint = Paint()
      ..color = const Color(0xFF000000)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(activePoint, 3.5, innerDotPaint);
  }

  Offset _getPointOnPathAtX(Path path, double targetX) {
    final PathMetric metric = path.computeMetrics().first;
    double low = 0;
    double high = metric.length;
    Offset result = metric.getTangentForOffset(0)?.position ?? Offset.zero;

    for (int i = 0; i < 25; i++) {
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
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.sidePadding != sidePadding;
  }
}
