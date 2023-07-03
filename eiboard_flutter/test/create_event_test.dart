import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/components/custom_date_picker.dart';
import 'package:eiboard_flutter/pages/components/custom_text_form_field.dart';
import 'package:eiboard_flutter/pages/components/custom_time_picker.dart';
import 'package:eiboard_flutter/pages/create_event_screen.dart';
import 'package:eiboard_flutter/utils/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('CreateEventScreen - Initial UI', (WidgetTester tester) async {
    final authProvider = AuthProvider();
    authProvider.userID = '123';
    authProvider.bearerToken = 'dummy_token';

    await tester.pumpWidget(
      ChangeNotifierProvider<AuthProvider>.value(
        value: authProvider,
        child: const MaterialApp(
          home: CreateEventScreen(),
        ),
      ),
    );

    expect(find.text('Create New Event'), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(CustomTextFormField), findsNWidgets(4));
    expect(find.byType(CustomDatePicker), findsOneWidget);
    expect(find.byType(CustomTimePicker), findsNWidgets(2));
    expect(find.byType(ChoiceChip), findsNWidgets(4));
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Button), findsOneWidget);
  });

  testWidgets('CreateEventScreen - Submit Form with valid inputs',
      (WidgetTester tester) async {
    final authProvider = AuthProvider();
    authProvider.userID = '123';
    authProvider.bearerToken = 'dummy_token';

    await tester.pumpWidget(
      ChangeNotifierProvider<AuthProvider>.value(
        value: authProvider,
        child: const MaterialApp(
          home: CreateEventScreen(),
        ),
      ),
    );
    await tester.enterText(
        find.byType(CustomTextFormField).at(0), 'Event Title');
    await tester.enterText(find.byType(CustomDatePicker), '2023-07-03');
    await tester.enterText(find.byType(CustomTimePicker).at(0), '10:00 AM');
    await tester.enterText(find.byType(CustomTimePicker).at(1), '11:00 AM');
    await tester.enterText(
        find.byType(CustomTextFormField).at(1), 'Event Location');

    await tester.tap(find.text('Create Event'));
    await tester.pumpAndSettle();
  });

  testWidgets('CreateEventScreen - Submit Form with empty title',
      (WidgetTester tester) async {
    final authProvider = AuthProvider();
    authProvider.userID = '123';
    authProvider.bearerToken = 'dummy_token';
    await tester.pumpWidget(
      ChangeNotifierProvider<AuthProvider>.value(
        value: authProvider,
        child: const MaterialApp(
          home: CreateEventScreen(),
        ),
      ),
    );

    await tester.enterText(find.byType(CustomDatePicker), '2023-07-03');
    await tester.enterText(find.byType(CustomTimePicker).at(0), '10:00 AM');
    await tester.enterText(find.byType(CustomTimePicker).at(1), '11:00 AM');
    await tester.enterText(
        find.byType(CustomTextFormField).at(1), 'Event Location');

    await tester.tap(find.text('Create Event'));
    await tester.pumpAndSettle();
    expect(find.text('This field can not be empty'), findsOneWidget);
  });

  testWidgets('CreateEventScreen - Submit Form with wrong date format',
      (WidgetTester tester) async {
    final authProvider = AuthProvider();
    authProvider.userID = '123';
    authProvider.bearerToken = 'dummy_token';

    await tester.pumpWidget(
      ChangeNotifierProvider<AuthProvider>.value(
        value: authProvider,
        child: const MaterialApp(
          home: CreateEventScreen(),
        ),
      ),
    );

    await tester.enterText(find.byType(CustomTextFormField), 'Event Title');
    await tester.enterText(find.byType(CustomDatePicker), '2023');
    await tester.enterText(find.byType(CustomTimePicker).at(0), '10:00 AM');
    await tester.enterText(find.byType(CustomTimePicker).at(1), '11:00 AM');
    await tester.enterText(
        find.byType(CustomTextFormField).at(1), 'Event Location');

    await tester.tap(find.text('Create Event'));
    await tester.pumpAndSettle();

    expect(find.text('Use YYYY-MM-DD format'), findsOneWidget);
  });
}
