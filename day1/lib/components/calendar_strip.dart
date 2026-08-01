import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/text_styles.dart';

/// Visual states for calendar day cells.
enum CalendarDayState {
  normal,
  past,
  selected,
}

/// Data model for a single calendar day.
class CalendarDayData {
  final String day;
  final String weekDay;
  final CalendarDayState state;

  const CalendarDayData({
    required this.day,
    required this.weekDay,
    required this.state,
  });
}

/// Two-row calendar strip with pixel-aligned weekday/date columns.
class CalendarStrip extends StatelessWidget {
  const CalendarStrip({super.key});

  static const List<CalendarDayData> _days = [
    CalendarDayData(day: '1', weekDay: 'SUN', state: CalendarDayState.past),
    CalendarDayData(day: '2', weekDay: 'MON', state: CalendarDayState.past),
    CalendarDayData(day: '3', weekDay: 'TUE', state: CalendarDayState.normal),
    CalendarDayData(day: '4', weekDay: 'WED', state: CalendarDayState.selected),
    CalendarDayData(day: '5', weekDay: 'THR', state: CalendarDayState.normal),
    CalendarDayData(day: '6', weekDay: 'FRI', state: CalendarDayState.normal),
    CalendarDayData(day: '7', weekDay: 'SAT', state: CalendarDayState.normal),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        _days.indexWhere((d) => d.state == CalendarDayState.selected);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.calendarHorizontalInset,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final colWidth = constraints.maxWidth / _days.length;

          return SizedBox(
            height: AppSpacing.selectedCapsuleHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppSpacing.weekdayRowHeight,
                        child: Row(
                          children: _days.map((d) {
                            final isSelected =
                                d.state == CalendarDayState.selected;
                            return Expanded(
                              child: Center(
                                child: Opacity(
                                  opacity: isSelected ? 0.0 : 1.0,
                                  child: Text(
                                    d.weekDay,
                                    style: AppTextStyles.weekdayLabel,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.weekdayToDateGap),
                      SizedBox(
                        height: AppSpacing.dateRowHeight,
                        child: Row(
                          children: _days.map(_buildDateCell).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                if (selectedIndex >= 0)
                  Positioned(
                    left: colWidth * selectedIndex +
                        (colWidth - AppSpacing.selectedCapsuleWidth) / 2,
                    top: 0,
                    child: _SelectedCapsule(
                      day: _days[selectedIndex].day,
                      weekDay: _days[selectedIndex].weekDay,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDateCell(CalendarDayData data) {
    if (data.state == CalendarDayState.selected) {
      return const Expanded(child: SizedBox());
    }

    return Expanded(
      child: Center(
        child: _DateNumber(
          day: data.day,
          isPast: data.state == CalendarDayState.past,
        ),
      ),
    );
  }
}

/// Vertical peach capsule containing WED + 4, aligned horizontally with weekday row.
class _SelectedCapsule extends StatelessWidget {
  final String day;
  final String weekDay;

  const _SelectedCapsule({required this.day, required this.weekDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.selectedCapsuleWidth,
      height: AppSpacing.selectedCapsuleHeight,
      padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: AppColors.peach,
        borderRadius: BorderRadius.circular(AppRadius.selectedCapsule),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppSpacing.weekdayRowHeight,
            child: Center(
              child: Text(
                weekDay,
                style: AppTextStyles.weekdayLabel,
                textHeightBehavior: AppTextStyles.tightHeight,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.weekdayToDateGap),
          SizedBox(
            height: AppSpacing.dateRowHeight,
            child: Center(
              child: Text(
                day,
                style: AppTextStyles.daySelected,
                textHeightBehavior: AppTextStyles.tightHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Date number — plain or inside a peach circle for past days.
class _DateNumber extends StatelessWidget {
  final String day;
  final bool isPast;

  const _DateNumber({required this.day, required this.isPast});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.pastCircleSize,
      height: AppSpacing.pastCircleSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isPast ? AppColors.peach : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Text(day, style: AppTextStyles.dayNormal),
    );
  }
}
