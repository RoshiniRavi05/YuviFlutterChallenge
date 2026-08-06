import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/exercise_2_card.dart';
import '../widgets/exercise_card.dart';
import '../widgets/workout_header.dart';

/// Refined Workout Details Dashboard screen for Day 4 (complete version with Exercise 2/8 card and peeking bottom section).
class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.outerBackground,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 36.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  onBackPressed: () => Navigator.maybePop(context),
                ),
                const SizedBox(height: 24.0),
                const WorkoutHeader(),
                const SizedBox(height: 24.0),
                const ExerciseCard(),
                const SizedBox(height: 16.0),
                const Exercise2Card(),
                const SizedBox(height: 14.0),
                // Static top-curved peeking 3rd card container matching reference design
                Container(
                  width: double.infinity,
                  height: 38.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                    border: Border.all(
                      color: const Color(0xFFF2F2F2),
                      width: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
