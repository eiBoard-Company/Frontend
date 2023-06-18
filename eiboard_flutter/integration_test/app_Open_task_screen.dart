import 'package:eiboard_flutter/pages/components/custom_app_bar.dart';
import 'package:eiboard_flutter/pages/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:eiboard_flutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('open task screen', (tester) async {
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

      await tester.pump(const Duration(milliseconds: 30000));

      //await tester.tap(find.byKey(const Key('TaskBox')));
      //await tester.pumpAndSettle();
    });
  });
}
