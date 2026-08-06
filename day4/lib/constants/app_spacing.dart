/// Spacing, sizing, and ratio design tokens measured from reference image.
class AppSpacing {
  AppSpacing._();

  // ── Screen ──────────────────────────────────────────────────────────────
  static const double screenHorizontal = 20.0;
  static const double screenTop = 14.0;

  // ── Header ──────────────────────────────────────────────────────────────
  static const double avatarSize = 52.0;
  static const double avatarToGreeting = 12.0;
  static const double greetingWordGap = 4.0;
  static const double notificationSize = 48.0;
  static const double notificationBellSize = 20.0;
  static const double redDotSize = 6.0;
  static const double redDotOffset = 5.0;

  // ── Section gaps ────────────────────────────────────────────────────────
  static const double headerToMonth = 26.0;
  static const double monthToCalendar = 22.0;
  static const double calendarToCards = 26.0;

  // ── Month selector ────────────────────────────────────────────────────────
  static const double monthPillHPadding = 22.0;
  static const double monthPillVPadding = 13.0;
  static const double monthArrowWidth = 18.0;
  static const double monthArrowHeight = 9.0;

  // ── Calendar ──────────────────────────────────────────────────────────────
  static const double weekdayRowHeight = 14.0;
  static const double weekdayToDateGap = 6.0;
  static const double dateRowHeight = 28.0;
  static const double selectedCapsuleWidth = 44.0;
  static const double selectedCapsuleHeight = 72.0;
  static const double selectedCapsuleInnerGap = 4.0;
  static const double pastCircleSize = 28.0;
  static const double calendarHorizontalInset = 2.0;

  // ── Stat cards ────────────────────────────────────────────────────────────
  static const double cardGap = 14.0;
  static const double cardPaddingH = 20.0;
  static const double cardPaddingV = 20.0;
  static const double cardTitleToValue = 42.0;   // Vertical gap between Title and Value
  static const double cardValueToSubtitle = 8.0;   // Vertical gap between Value and Subtitle
  static const double cardIconCircleSize = 22.0;
  static const double cardClockIconSize = 12.0;
  static const double cardEyeIconSize = 13.0;

  /// Aspect ratio height multiplier (height = width * 1.25 for taller cards).
  static const double cardAspectRatioHeightMultiplier = 1.25;
}
