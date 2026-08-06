import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import 'circular_progress_widget.dart';
import 'percentage_badge.dart';
import 'weekly_points_chart.dart';

/// Weekly Points Card component combining Circular Progress gauge, statistics score, percentage badge, menu icon, and smooth line graph chart.
class WeeklyPointsCard extends StatelessWidget {
  const WeeklyPointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.0),
        border: Border.all(color: const Color(0xFFE5E9EB), width: 1.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Progress Ring, Title & Score, Menu Icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular progress indicator (64%)
              const CircularProgressWidget(
                progress: 0.64,
                percentageText: '64%',
                size: 56.0,
              ),
              const SizedBox(width: 14),
              // Heading, Value, and Badge
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weekly points',
                      style: GoogleFonts.inter(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E2325),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '1544',
                          style: GoogleFonts.inter(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF000000),
                            letterSpacing: -0.5,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const PercentageBadge(text: '6%'),
                      ],
                    ),
                  ],
                ),
              ),
              // Three-dot menu icon
              const Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Icon(
                  Icons.more_horiz,
                  color: Color(0xFF1E2325),
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Chart Container
          const WeeklyPointsChart(),
        ],
      ),
    );
  }
}
