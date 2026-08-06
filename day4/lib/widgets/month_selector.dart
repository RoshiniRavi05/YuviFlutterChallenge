import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
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
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Feb ',
                  style: GoogleFonts.inter(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000),
                  ),
                ),
                TextSpan(
                  text: '2025',
                  style: GoogleFonts.inter(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ],
            ),
          ),
        ),
        const ThinArrowIcon(pointingRight: true),
      ],
    );
  }
}
