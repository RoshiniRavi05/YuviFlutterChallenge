import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Typography matched precisely to reference mockup (Inter).
class AppTextStyles {
  AppTextStyles._();

  static TextStyle _font({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double letterSpacing = 0,
    double height = 1.0,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  /// Tight line metrics for calendar and card values.
  static const TextHeightBehavior tightHeight = TextHeightBehavior(
    applyHeightToFirstAscent: false,
    applyHeightToLastDescent: false,
  );

  /// "Hello," — bold (20px, w700)
  static final TextStyle greetingBold = _font(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
    height: 1.2,
  );

  /// "Sophia" — regular (20px, w400)
  static final TextStyle greetingRegular = _font(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
    height: 1.2,
  );

  /// Month pill ("Feb 2025") — 15.5px Inter SemiBold (w600), pure black (#000000)
  static final TextStyle monthPill = _font(
    fontSize: 15.5,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
    letterSpacing: 0,
    height: 1.0,
  );

  /// Weekday label ("SUN"…"SAT")
  static final TextStyle weekdayLabel = _font(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
    letterSpacing: 0.3,
    height: 1.0,
  );

  /// Date number
  static final TextStyle dayNormal = _font(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
    height: 1.0,
  );

  /// Selected date number (bold '4' inside WED 4 capsule)
  static final TextStyle daySelected = _font(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
    height: 1.0,
  );

  /// Card title ("Time", "Exercises") — w600, 15px
  static final TextStyle cardTitle = _font(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    height: 1.0,
  );

  /// Card value ("1:30", "12/8") — 32px Inter medium numeral matching sample
  static final TextStyle cardValue = _font(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
    letterSpacing: -0.5,
    height: 1.0,
  );

  /// Card subtitle ("Hours", "Tasks") — secondary grey (13px, w400)
  static final TextStyle cardSubtitle = _font(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
    height: 1.0,
  );
}
