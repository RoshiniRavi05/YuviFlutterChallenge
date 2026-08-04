import 'package:flutter/material.dart';

import '../constants/colors.dart';

/// Equalizer graphic displaying 7 vertical bars with exact color pattern:
/// [black, black, black, green (with dot), green (with dot), black, black]
class MiniBarChart extends StatelessWidget {
  final double width;
  final double height;

  const MiniBarChart({
    super.key,
    this.width = 48.0,
    this.height = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: const CustomPaint(
        painter: _MiniBarChartPainter(),
      ),
    );
  }
}

class _MiniBarChartPainter extends CustomPainter {
  const _MiniBarChartPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const double barWidth = 3.6;
    final double gap = (size.width - (7 * barWidth)) / 6;
    const double dotRadius = 1.8;
    const double dotGap = 3.0;

    // Relative height ratios for the 7 bars matching reference image
    final List<double> barRatios = [0.42, 0.74, 0.74, 0.88, 0.54, 0.60, 0.74];

    final List<Color> barColors = [
      AppColors.textDark, // 1. black
      AppColors.textDark, // 2. black
      AppColors.textDark, // 3. black
      AppColors.accentGreen, // 4. green (#91BA48)
      AppColors.accentGreen, // 5. green (#91BA48)
      AppColors.textDark, // 6. black
      AppColors.textDark, // 7. black
    ];

    for (int i = 0; i < 7; i++) {
      final double x = i * (barWidth + gap);
      final double barH = size.height * barRatios[i];
      final double top = size.height - barH;

      final RRect rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, top, barWidth, barH),
        const Radius.circular(1.8),
      );

      final Paint paint = Paint()
        ..color = barColors[i]
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      canvas.drawRRect(rect, paint);

      // Add green circle dot above 4th (i=3) and 5th (i=4) bars matching reference image
      if (i == 3 || i == 4) {
        final Paint dotPaint = Paint()
          ..color = barColors[i]
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

        canvas.drawCircle(
          Offset(x + barWidth / 2, top - dotGap - dotRadius),
          dotRadius,
          dotPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

