import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import 'custom_icons.dart';

/// White circular notification button with optically centered bell icon and red badge.
class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSpacing.notificationSize,
      height: AppSpacing.notificationSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: AppSpacing.notificationSize,
            height: AppSpacing.notificationSize,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.notificationButton),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.notificationShadow,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: BellIcon(
                size: AppSpacing.notificationBellSize,
                color: AppColors.text,
                strokeWidth: 1.3,
              ),
            ),
          ),
          Positioned(
            top: AppSpacing.redDotOffset,
            right: AppSpacing.redDotOffset,
            child: Container(
              width: AppSpacing.redDotSize,
              height: AppSpacing.redDotSize,
              decoration: const BoxDecoration(
                color: AppColors.redDot,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
