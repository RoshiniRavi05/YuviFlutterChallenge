import 'package:flutter/material.dart';

import 'chart_grid.dart';
import 'chart_labels.dart';
import 'chart_line.dart';

/// Off-white chart container encapsulating vertical grid, bezier line, active dot, and day labels.
class WeeklyPointsChart extends StatelessWidget {
  final double chartHeight;

  const WeeklyPointsChart({super.key, this.chartHeight = 124.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8F8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: chartHeight,
            width: double.infinity,
            child: const Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(painter: ChartGridPainter()),
                ),
                Positioned.fill(
                  child: CustomPaint(painter: ChartLinePainter()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const ChartLabels(),
        ],
      ),
    );
  }
}
