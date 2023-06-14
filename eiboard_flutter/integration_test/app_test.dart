import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:eiboard_flutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('open our flutterApp and click Log-In',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder button = find.byTooltip('LogInButton');

      await tester.tap(button);

      await tester.pumpAndSettle();
      
    });
  });
}