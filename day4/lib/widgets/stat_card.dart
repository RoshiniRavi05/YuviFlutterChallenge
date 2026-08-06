import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_radius.dart';
import '../theme/text_styles.dart';

/// Stat card with compact top-aligned vertical rhythm.
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color backgroundColor;
  final Widget iconBadge;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.backgroundColor,
    required this.iconBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.cardPaddingH,
        vertical: AppSpacing.cardPaddingV,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.cardTitle),
              iconBadge,
            ],
          ),
          const SizedBox(height: AppSpacing.cardTitleToValue),
          Text(
            value,
            style: AppTextStyles.cardValue,
            textHeightBehavior: AppTextStyles.tightHeight,
          ),
          const SizedBox(height: AppSpacing.cardValueToSubtitle),
          Text(
            subtitle,
            style: AppTextStyles.cardSubtitle,
            textHeightBehavior: AppTextStyles.tightHeight,
          ),
        ],
      ),
    );
  }
}
