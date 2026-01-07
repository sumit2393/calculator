// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/ui/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Calculator screen shows result when valid input given', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CalculatorProvider(),
        child: MaterialApp(home: CalculatorScreen()),
      ),
    );

    // Enter input
    await tester.enterText(find.byType(TextField), '1,2,3');

    // Tap button
    await tester.tap(find.text('Calculate'));
    await tester.pump();

    // Expect result
    expect(find.text('Result: 6'), findsOneWidget);
  });

  testWidgets('Shows error message for negative numbers', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CalculatorProvider(),
        child: MaterialApp(home: CalculatorScreen()),
      ),
    );

    await tester.enterText(find.byType(TextField), '1,-2');
    await tester.tap(find.text('Calculate'));
    await tester.pump();

    expect(find.textContaining('negative numbers not allowed'), findsOneWidget);
  });
}
