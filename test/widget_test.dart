import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:career_craft/main.dart';

void main() {
  testWidgets('CareerCraft app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CareerCraftApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
