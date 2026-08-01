import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Root application widget launching the Day 1 HomeScreen.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] instance.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker - Day 1',
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
