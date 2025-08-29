import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_task/widgets/error_bottomsheet.dart';

void main() {
  testWidgets('ErrorBottomSheet displays correct content for code 401 and close on tap close Button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () => ErrorBottomSheet.show(context, 401),
                child: const Text('Show Error'),
              ),
            );
          }
        )
      )
    );

    await tester.tap(find.text('Show Error'));
    await tester.pumpAndSettle();

    expect(find.text('Unauthorized'), findsOneWidget);
    expect(find.text('Invalid email or password.'), findsOneWidget);
    expect(find.byIcon(Icons.error), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();

    expect(find.text('Unauthorized'), findsNothing);
  });

  testWidgets('ErrorBottomSheet displays default error for unknown code', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () => ErrorBottomSheet.show(context, 999),
                child: const Text('Show Error'),
              ),
            );
          })
      )
    );

    // Show bottom sheet
    await tester.tap(find.text('Show Error'));
    await tester.pumpAndSettle();

    expect(find.text('Oops!'), findsOneWidget);
    expect(find.text('An unexpected error occurred.'), findsOneWidget);
  });
}
