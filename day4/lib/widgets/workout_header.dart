import 'package:flutter/material.dart';

import '../constants/typography.dart';
import 'bicep_icon.dart';
import 'mini_bar_chart.dart';

/// Workout header section presenting fitness icon, title, duration, and 7-bar equalizer graphic.
class WorkoutHeader extends StatelessWidget {
  final String title;
  final String durationText;

  const WorkoutHeader({
    super.key,
    this.title = 'Workout',
    this.durationText = '90 min',
  });
      

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Circular Light Blue Badge with Flexed Bicep Icon (44x44)
        const Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: BicepIcon(
            size: 44.0,
          ),
        ),

        const SizedBox(width: 12.0),

        // Title and Duration Metric
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTypography.workoutLabel,
              ),
              const SizedBox(height: 2.0),
              Text(
                durationText,
                style: AppTypography.heroMetric,
              ),
            ],
          ),
        ),

        // Right 7-Bar Equalizer Graphic
        const MiniBarChart(
          width: 52.0,
          height: 32.0,
        ),
      ],
    );

  
  }
}
