import 'package:flutter_test/flutter_test.dart';
import 'package:loading_card/loading_card.dart';

void main() {
  testWidgets('Widget is able to be created', (WidgetTester tester) async {
    await tester.pumpWidget(
      LoadingCard()
    );
  });
}