import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'top_action_icons.dart';

/// Top custom navigation bar with circular back button and right action pill container.
class CustomAppBar extends StatelessWidget {
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Pure White Circular Back Button (44x44)
        GestureDetector(
          onTap: onBackPressed,
          child: Container(
            width: 44.0,
            height: 44.0,
            decoration: const BoxDecoration(
              color: AppColors.surfaceWhite,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back,
                color: AppColors.textDark,
                size: 18.0,
              ),
            ),
          ),
        ),

        // Right Action Toolbar Capsule (Height 44, Radius 22)
        Container(
          height: 44.0,
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: BorderRadius.circular(22.0),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedStarIcon(
                size: 18.0,
                color: AppColors.textDark,
              ),
              SizedBox(width: 12.0),
              EditPencilIcon(
                size: 18.0,
                color: AppColors.textDark,
              ),
              SizedBox(width: 12.0),
              MoreDotsIcon(
                size: 18.0,
                color: AppColors.textDark,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
