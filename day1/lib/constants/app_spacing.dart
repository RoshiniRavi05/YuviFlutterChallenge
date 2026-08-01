/// Spacing, sizing, and ratio design tokens measured from reference image.
class AppSpacing {
  AppSpacing._();

  // ── Screen ──────────────────────────────────────────────────────────────
  static const double screenHorizontal = 22.0;
  static const double screenTop = 14.0;

  // ── Header ──────────────────────────────────────────────────────────────
  static const double avatarSize = 42.0;
  static const double avatarToGreeting = 10.0;
  static const double greetingWordGap = 4.0;
  static const double notificationSize = 38.0;
  static const double notificationBellSize = 17.0;
  static const double redDotSize = 5.0;
  static const double redDotOffset = 5.0;

  // ── Section gaps ────────────────────────────────────────────────────────
  static const double headerToMonth = 20.0;
  static const double monthToCalendar = 14.0;
  static const double calendarToCards = 22.0;

  // ── Month selector ────────────────────────────────────────────────────────
  static const double monthPillHPadding = 20.0;
  static const double monthPillVPadding = 11.0;
  static const double monthArrowWidth = 16.0;
  static const double monthArrowHeight = 8.0;

  // ── Calendar ──────────────────────────────────────────────────────────────
  static const double weekdayRowHeight = 13.0;
  static const double weekdayToDateGap = 4.0;
  static const double dateRowHeight = 26.0;
  static const double selectedCapsuleWidth = 44.0;
  static const double selectedCapsuleHeight = 68.0;
  static const double selectedCapsuleInnerGap = 4.0;
  static const double pastCircleSize = 26.0;
  static const double calendarHorizontalInset = 4.0;

  // ── Stat cards ────────────────────────────────────────────────────────────
  static const double cardGap = 12.0;
  static const double cardPaddingH = 18.0;
  static const double cardPaddingV = 18.0;
  static const double cardTitleToValue = 38.0;   // Large vertical gap between Title ("Time"/"Exercises") and Value ("1:30"/"12/8")
  static const double cardValueToSubtitle = 8.0;   // Small vertical gap between Value ("1:30"/"12/8") and Subtitle ("Hours"/"Tasks")
  static const double cardIconCircleSize = 18.0;
  static const double cardClockIconSize = 10.0;
  static const double cardEyeIconSize = 11.0;

  /// Aspect ratio height multiplier (height = width * 1.16 for taller-than-wide cards).
  static const double cardAspectRatioHeightMultiplier = 1.16;
}
