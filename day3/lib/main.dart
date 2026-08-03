import 'package:flutter/material.dart';

import 'screens/workout_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Root application widget launching the Day 3 WorkoutScreen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker - Day 3',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WorkoutScreen(),
    );
  }
}
