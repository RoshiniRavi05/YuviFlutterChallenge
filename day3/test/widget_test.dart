import 'package:flutter_test/flutter_test.dart';
import 'package:day3/main.dart';
import 'package:day3/screens/workout_screen.dart';

void main() {
  testWidgets('WorkoutScreen renders correctly', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify WorkoutScreen renders.
    expect(find.byType(WorkoutScreen), findsOneWidget);
    expect(find.text('Workout'), findsOneWidget);
    expect(find.text('90 min'), findsOneWidget);
  });
}
