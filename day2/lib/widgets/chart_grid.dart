import 'package:flutter/material.dart';

/// CustomPainter rendering 7 evenly spaced vertical dashed grid lines.
class ChartGridPainter extends CustomPainter {
  final Color lineDashColor;
  final double dashWidth;
  final double dashGap;

  const ChartGridPainter({
    this.lineDashColor = const Color(0xFFDCE2E5),
    this.dashWidth = 4.0,
    this.dashGap = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Paint dashPaint = Paint()
      ..color = lineDashColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 7; i++) {
      final double x = (width / 6) * i;
      double startY = 0;
      while (startY < height) {
        canvas.drawLine(
          Offset(x, startY),
          Offset(x, (startY + dashWidth).clamp(0, height)),
          dashPaint,
        );
        startY += dashWidth + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant ChartGridPainter oldDelegate) {
    return oldDelegate.lineDashColor != lineDashColor ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashGap != dashGap;
  }
}
