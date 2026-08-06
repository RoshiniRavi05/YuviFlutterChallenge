import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

/// Row displaying weekday column headers (SUN, MON, TUE, WED, THR, FRI, SAT) generated dynamically.
class WeekdayRow extends StatelessWidget {
  /// Creates a [WeekdayRow] instance.
  const WeekdayRow({super.key});

  /// Ordered weekday labels matching design specs.
  static const List<String> weekdays = [
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THR',
    'FRI',
    'SAT',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        weekdays.length,
        (index) => Expanded(
          child: Center(
            child: Text(weekdays[index], style: AppTextStyles.weekdayLabel),
          ),
        ),
      ),
    );
  }
}
