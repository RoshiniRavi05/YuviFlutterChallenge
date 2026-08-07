import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';
import 'exercise_stat_card.dart';
import 'time_card.dart';

/// Side-by-side Time and Exercises stat cards with taller-than-wide aspect ratio (1 : 1.16).
class CardsRow extends StatelessWidget {
  const CardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - AppSpacing.cardGap) / 2;
        final cardHeight =
            cardWidth * AppSpacing.cardAspectRatioHeightMultiplier;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: const TimeCard(),
            ),
            const SizedBox(width: AppSpacing.cardGap),
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: const ExerciseStatCard(),
            ),
          ],
        );
      },
    );
  }
}
