import 'package:expenses_app/main.dart'; // Adjust the import to match your project structure
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Add transaction smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ExpensesApp());

    // Verify that there are no transactions initially.
    expect(find.text('No transactions added yet!'), findsOneWidget);

    // Tap the '+' icon to add a transaction and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Fill out the form fields.
    await tester.enterText(find.byType(TextFormField).at(0), 'Test Category');
    await tester.enterText(find.byType(TextFormField).at(1), '50.0');
    await tester.enterText(find.byType(TextFormField).at(2), 'Test Remarks');
    await tester.enterText(find.byType(TextFormField).at(3), 'Test Notes');

    // Submit the form.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that the transaction has been added.
    expect(find.text('Test Category'), findsOneWidget);
    expect(find.text('50.0'), findsOneWidget);
    expect(find.text('Test Remarks'), findsOneWidget);
    expect(find.text('Test Notes'), findsOneWidget);

    // Verify that the total balance is updated.
    expect(find.text('Total Balance: \$50.00'), findsOneWidget);

    // Delete the transaction.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Verify that the transaction has been deleted.
    expect(find.text('No transactions added yet!'), findsOneWidget);
    expect(find.text('Test Category'), findsNothing);
    expect(find.text('50.0'), findsNothing);
    expect(find.text('Test Remarks'), findsNothing);
    expect(find.text('Test Notes'), findsNothing);

    // Verify that the total balance is updated.
    expect(find.text('Total Balance: \$0.00'), findsOneWidget);
  });
}
