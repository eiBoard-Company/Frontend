import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/components/email_input_field.dart';
import 'package:eiboard_flutter/pages/components/login_password_input_field.dart';
import 'package:eiboard_flutter/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginScreen - Initial UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(Button), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
  });

  testWidgets('LoginScreen - Submit Form with correct password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.enterText(find.byType(EMailInputField), 'test@example.com');
    await tester.enterText(find.byType(LoginPasswordInputField), 'password123');
    await tester.tap(find.text('LOGIN'));
    await tester.pump();
  });

  testWidgets('LoginScreen - Submit Form with incorrect password format',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.enterText(find.byType(EMailInputField), 'test@example.com');
    await tester.enterText(find.byType(LoginPasswordInputField), 'pass');
    await tester.tap(find.text('LOGIN'));
    await tester.pump();

    expect(find.text('Wrong E-Mail or Password'), findsOneWidget);
  });

  testWidgets('LoginScreen - Submit Form with incorrect email format',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.enterText(find.byType(EMailInputField), 'test');
    await tester.enterText(find.byType(LoginPasswordInputField), 'password123');
    await tester.tap(find.text('LOGIN'));
    await tester.pump();

    expect(find.text('Wrong E-Mail or Password'), findsOneWidget);
  });
}
