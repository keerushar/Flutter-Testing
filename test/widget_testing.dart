import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';

void main() {
  testWidgets('Widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'Gurzu');
    expect(find.text('Gurzu'), findsOneWidget);
    var button = find.text('Compute');
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    expect(find.text('uzruG'), findsOneWidget);
  });
}
