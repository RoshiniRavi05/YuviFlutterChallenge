import 'package:flutter_test/flutter_test.dart';
import 'package:day1/main.dart';
import 'package:day1/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that HomeScreen is rendered.
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}

