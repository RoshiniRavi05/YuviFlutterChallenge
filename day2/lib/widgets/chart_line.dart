import 'dart:ui';
import 'package:flutter/material.dart';

/// CustomPainter rendering the exact proportional bezier chart curve extending past grid lines to edges.
class ChartLinePainter extends CustomPainter {
  final Color lineColor;
  final double strokeWidth;
  final double sidePadding;

  const ChartLinePainter({
    this.lineColor = const Color(0xFF389EB6),
    this.strokeWidth = 4.0,
    this.sidePadding = 22.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final double availableWidth = width - (2 * sidePadding);
    double dayX(double index) => sidePadding + (availableWidth / 6) * index;

    // Control points: Starts at x = 0 (before 1st grid line), passes all 7 day lines, ends at x = width (after 7th grid line)
    final List<Offset> points = [
      Offset(0.0, height * 0.66),                          // Starts at far left edge before Sunday line
      Offset(dayX(0.0), height * 0.57),                     // Crest over Sunday (1st grid line)
      Offset(dayX(0.7), height * 0.72),                     // Dip between Sunday & Monday
      Offset(dayX(1.0), height * 0.62),                     // Rising through Monday (2nd grid line)
      Offset(dayX(2.0), height * 0.46),                     // Tuesday (3rd grid line) plateau start
      Offset(dayX(2.7), height * 0.47),                     // Wednesday plateau
      Offset(dayX(3.3), height * 0.76),                     // Lowest valley dip after Wednesday
      Offset(dayX(4.2), height * 0.40),                     // Ascending slope post-Wednesday (dot location!)
      Offset(dayX(5.0), height * 0.20),                     // Friday (6th grid line) HIGHEST PEAK
      Offset(dayX(6.0), height * 0.52),                     // Saturday (7th grid line)
      Offset(width, height * 0.56),                         // Extends all the way to far right edge after Saturday line
    ];

    // Smooth C1 continuous cubic spline path
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

    // Active Highlight Marker: White Outer Circle (radius 7.0) + Black Inner Center (radius 3.0)
    // Positioned directly on the curve at dayX(4.2) on the ascending slope
    final Offset activePoint = _getPointOnPathAtX(path, dayX(4.2));

    // Outer white circle (diameter 14px)
    final Paint outerDotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(activePoint, 7.0, outerDotPaint);

    // Inner black dot (diameter 6px)
    final Paint innerDotPaint = Paint()
      ..color = const Color(0xFF000000)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(activePoint, 3.0, innerDotPaint);
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
