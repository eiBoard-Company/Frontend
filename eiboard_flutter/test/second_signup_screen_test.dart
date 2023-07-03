import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/components/sign_up_text_form_field.dart';
import 'package:eiboard_flutter/pages/second_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SecondSignUpScreen - Create User Test', (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: SecondSignUpScreen(
            userEmail: 'test@example.com', userPassword: 'password12')));

    await tester.enterText(
        find.widgetWithText(SignUpTextFormField, 'Your first name'), '');
    await tester.enterText(
        find.widgetWithText(SignUpTextFormField, 'Your last name'), '');

    await tester.tap(find.widgetWithText(Button, 'GET STARTED'));

    await tester.pump();

    expect(find.text('This field cannot be empty'), findsNWidgets(2));

    await tester.enterText(
        find.widgetWithText(SignUpTextFormField, 'Your first name'), 'John');
    await tester.enterText(
        find.widgetWithText(SignUpTextFormField, 'Your last name'), 'Doe');

    await tester.tap(find.widgetWithText(Button, 'GET STARTED'));

    await tester.pump();
  });
}
