import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';

/// White circular notification button displaying the SVG bell icon and red badge.
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
            child: Center(
              child: SvgPicture.asset(
                'assets/images/notification.svg',
                width: AppSpacing.notificationBellSize,
                height: AppSpacing.notificationBellSize,
                colorFilter: const ColorFilter.mode(
                  AppColors.text,
                  BlendMode.srcIn,
                ),
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
