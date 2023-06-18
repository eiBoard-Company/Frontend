import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:eiboard_flutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('open our flutterApp and log in', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('LogInButton')));

      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('EmailInput')), 'testmail@gmail.com');
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('PasswordInput1')), 'test123');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('LogIntoApp')));
      await tester.pumpAndSettle();

      expect(find.text('Hello Chicken!'), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}
