import 'package:flutter/material.dart';

/// CustomPainter rendering 7 vertical dashed grid lines inset with side margins.
class ChartGridPainter extends CustomPainter {
  final Color lineDashColor;
  final double dashWidth;
  final double dashGap;
  final double sidePadding;

  const ChartGridPainter({
    this.lineDashColor = const Color(0xFFE2E7EA),
    this.dashWidth = 3.5,
    this.dashGap = 3.5,
    this.sidePadding = 22.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Paint dashPaint = Paint()
      ..color = lineDashColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final double availableWidth = width - (2 * sidePadding);

    for (int i = 0; i < 7; i++) {
      final double x = sidePadding + (availableWidth / 6) * i;
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
        oldDelegate.dashGap != dashGap ||
        oldDelegate.sidePadding != sidePadding;
  }
}
