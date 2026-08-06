import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../screens/workout_screen.dart';
import '../theme/app_colors.dart';
import 'custom_icons.dart';
import 'stat_card.dart';

/// Exercises stat card for Dashboard with tap action to navigate to WorkoutScreen.
class ExerciseStatCard extends StatelessWidget {
  final VoidCallback? onTap;

  const ExerciseStatCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WorkoutScreen(),
              ),
            );
          },
      child: const StatCard(
        title: 'Exercises',
        value: '12/8',
        subtitle: 'Tasks',
        backgroundColor: AppColors.lightGreen,
        iconBadge: SizedBox(
          width: AppSpacing.cardIconCircleSize,
          height: AppSpacing.cardIconCircleSize,
          child: Center(
            child: EyeIcon(
              size: AppSpacing.cardIconCircleSize,
            ),
          ),
        ),
      ),
    );
  }
}
