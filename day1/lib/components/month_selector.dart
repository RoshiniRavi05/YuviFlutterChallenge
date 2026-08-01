import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/text_styles.dart';
import 'custom_icons.dart';

/// Month navigation row with hairline editorial arrows and peach pill.
class MonthSelector extends StatelessWidget {
  const MonthSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ThinArrowIcon(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.monthPillHPadding,
            vertical: AppSpacing.monthPillVPadding,
          ),
          decoration: BoxDecoration(
            color: AppColors.peach,
            borderRadius: BorderRadius.circular(AppRadius.monthPill),
          ),
          child: Text('Feb 2025', style: AppTextStyles.monthPill),
        ),
        const ThinArrowIcon(pointingRight: true),
      ],
    );
  }
}
