import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import 'custom_icons.dart';
import 'stat_card.dart';

/// Time stat card.
class TimeCard extends StatelessWidget {
  const TimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StatCard(
      title: 'Time',
      value: '1:30',
      subtitle: 'Hours',
      backgroundColor: AppColors.lightBlue,
      iconBadge: Container(
        width: AppSpacing.cardIconCircleSize,
        height: AppSpacing.cardIconCircleSize,
        decoration: const BoxDecoration(
          color: AppColors.blueIconBg,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: ClockIcon(
            size: AppSpacing.cardClockIconSize,
            strokeWidth: 0.9,
          ),
        ),
      ),
    );
  }
}
