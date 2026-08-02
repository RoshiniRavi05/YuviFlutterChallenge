import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import 'custom_icons.dart';
import 'stat_card.dart';

/// Exercises stat card.
class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StatCard(
      title: 'Exercises',
      value: '12/8',
      subtitle: 'Tasks',
      backgroundColor: AppColors.lightGreen,
      iconBadge: Container(
        width: AppSpacing.cardIconCircleSize,
        height: AppSpacing.cardIconCircleSize,
        decoration: const BoxDecoration(
          color: AppColors.greenIconBg,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: EyeIcon(
            size: AppSpacing.cardEyeIconSize,
            strokeWidth: 0.9,
          ),
        ),
      ),
    );
  }
}
