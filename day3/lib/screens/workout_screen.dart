import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/exercise_card.dart';
import '../widgets/workout_header.dart';

/// Standalone Workout Details Dashboard screen matching reference design.
class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.outerBackground,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(height: 18.0),
                WorkoutHeader(),
                SizedBox(height: 26.0),
                ExerciseCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
