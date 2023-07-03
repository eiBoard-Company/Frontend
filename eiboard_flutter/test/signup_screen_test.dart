import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/components/email_input_field.dart';
import 'package:eiboard_flutter/pages/components/password_input_field.dart';
import 'package:eiboard_flutter/pages/login_screen.dart';
import 'package:eiboard_flutter/pages/second_sign_up_screen.dart';
import 'package:eiboard_flutter/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SignUpScreen - Sign Up Button Test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignUpScreen()));

    await tester.enterText(find.byType(EMailInputField), 'test@example.com');
    await tester.enterText(find.byType(PasswordInputField), 'password');

    await tester.tap(find.byType(Button));

    await tester.pump();

    expect(find.byType(SecondSignUpScreen), findsOneWidget);

    final secondSignUpScreen =
        tester.widget<SecondSignUpScreen>(find.byType(SecondSignUpScreen));
    expect(secondSignUpScreen.userEmail, equals('test@example.com'));
    expect(secondSignUpScreen.userPassword, equals('password'));
  });

  testWidgets('SignUpScreen - Sign In Button Test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignUpScreen()));

    await tester.tap(find.text("Already have an account? Sign in."));

    await tester.pump();

    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
