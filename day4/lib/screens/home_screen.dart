import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../theme/app_colors.dart';
import '../widgets/calendar_strip.dart';
import '../widgets/cards_row.dart';
import '../widgets/header_section.dart';
import '../widgets/month_selector.dart';
import '../widgets/weekly_points_card.dart';

/// Primary dashboard screen ported from Day 2 into Day 4.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.screenHorizontal,
              AppSpacing.screenTop,
              AppSpacing.screenHorizontal,
              20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(),
                SizedBox(height: AppSpacing.headerToMonth),
                MonthSelector(),
                SizedBox(height: AppSpacing.monthToCalendar),
                CalendarStrip(),
                SizedBox(height: AppSpacing.calendarToCards),
                CardsRow(),
                SizedBox(height: AppSpacing.cardGap),
                WeeklyPointsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
