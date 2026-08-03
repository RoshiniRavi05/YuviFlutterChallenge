import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/// Typography text style tokens using Inter Google Fonts.
class AppTypography {
  AppTypography._();

  /// Subtitle "Workout" label style (Weight 500, Size 12)
  static TextStyle workoutLabel = GoogleFonts.inter(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
    height: 1.1,
  );

  /// Main hero metric "90 min" style (Weight 700, Size 18)
  static TextStyle heroMetric = GoogleFonts.inter(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    letterSpacing: -0.4,
    height: 1.1,
  );

  /// Exercise card title "Exercise" (Weight 700, Size 22)
  static TextStyle exerciseTitle = GoogleFonts.inter(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  /// Exercise index badge "1/8" (Weight 600, Size 13)
  static TextStyle exerciseBadge = GoogleFonts.inter(
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  /// Timer metric "1:29:59" (Weight 700, Size 24)
  static TextStyle timerText = GoogleFonts.inter(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    letterSpacing: -0.5,
  );

  /// Subtitle "Running" under center gauge (Gray #707070, Weight 500, Size 12)
  static TextStyle runningLabel = GoogleFonts.inter(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textGray,
  );

  /// Distance metric "10km" (Weight 700, Size 22)
  static TextStyle distanceText = GoogleFonts.inter(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    letterSpacing: -0.5,
  );

  /// Metric title label e.g. "VO₂" (Weight 500, Size 15)
  static TextStyle metricLabel = GoogleFonts.inter(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  /// Metric numeric value e.g. "29", "98" (Weight 700, Size 22)
  static TextStyle metricValue = GoogleFonts.inter(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  /// STOP button text (Weight 700, Size 15, Letter spacing ~0.8)
  static TextStyle stopButtonText = GoogleFonts.inter(
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    letterSpacing: 0.8,
  );
}
