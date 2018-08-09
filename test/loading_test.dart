import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loading/loading.dart';

void main() {
  testWidgets('Widget is able to be created', (WidgetTester tester) async {
    await tester.pumpWidget(
      LoadingCard()
    );
  });
}