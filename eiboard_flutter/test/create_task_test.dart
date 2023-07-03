import 'package:eiboard_flutter/model/date_time_formatter.dart';
import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/components/custom_date_picker.dart';
import 'package:eiboard_flutter/pages/components/custom_text_form_field.dart';
import 'package:eiboard_flutter/pages/components/custom_time_picker.dart';
import 'package:eiboard_flutter/pages/components/task_List_Object.dart';
import 'package:eiboard_flutter/pages/create_task_screen.dart';
import 'package:eiboard_flutter/pages/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CreateTaskScreen - Create Task Button Test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CreateTaskScreen()));

    await tester.enterText(
        find.byType(CustomTextFormField).at(0), 'Task Title');
    await tester.enterText(
        find.byType(CustomTextFormField).at(1), 'Description');
    await tester.enterText(find.byType(CustomDatePicker), '2023-07-03');
    await tester.enterText(find.byType(CustomTimePicker), '10:00 AM');

    await tester.tap(find.byType(Button));

    await tester.pump();

    expect(find.byType(TodoListScreen), findsOneWidget);

    final createdTask = TaskListObject(
      taskname: 'Task Title',
      subject: 'Software Engineering',
      description: 'Description',
      time: DateTimeFormatter.formatDateTime('2023-07-03', '10:00 AM'),
    );
    expect(createdTask.taskname, equals('Task Title'));
    expect(createdTask.subject, equals('Software Engineering'));
    expect(createdTask.description, equals('Description'));
    expect(createdTask.time, equals(DateTime.parse('2023-07-03 10:00 AM')));
  });
  testWidgets('CreateTaskScreen - Empty Title Validation Test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CreateTaskScreen()));

    await tester.enterText(find.byType(CustomTextFormField).at(0), '');
    await tester.enterText(
        find.byType(CustomTextFormField).at(1), 'Description');
    await tester.enterText(find.byType(CustomDatePicker), '2023-07-03');
    await tester.enterText(find.byType(CustomTimePicker), '10:00 AM');

    await tester.tap(find.byType(Button));

    await tester.pump();

    expect(find.byType(TodoListScreen), findsNothing);

    expect(find.text('This field can not be empty'), findsOneWidget);
  });

  testWidgets('CreateTaskScreen - Wrong Date Format Validation Test',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CreateTaskScreen()));

    await tester.enterText(
        find.byType(CustomTextFormField).at(0), 'Task Title');
    await tester.enterText(
        find.byType(CustomTextFormField).at(1), 'Description');
    await tester.enterText(find.byType(CustomDatePicker), '2023/07/03');
    await tester.enterText(find.byType(CustomTimePicker), '10:00 AM');

    await tester.tap(find.byType(Button));

    await tester.pump();

    expect(find.byType(TodoListScreen), findsNothing);

    expect(find.text('Invalid date format'), findsOneWidget);
  });

  testWidgets('CreateTaskScreen - Wrong Time Format Validation Test',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CreateTaskScreen()));

    await tester.enterText(
        find.byType(CustomTextFormField).at(0), 'Task Title');
    await tester.enterText(
        find.byType(CustomTextFormField).at(1), 'Description');
    await tester.enterText(find.byType(CustomDatePicker), '2023-07-03');
    await tester.enterText(find.byType(CustomTimePicker), '10:00');

    await tester.tap(find.byType(Button));

    await tester.pump();

    expect(find.byType(TodoListScreen), findsNothing);

    expect(find.text('Use HH:MM AM/PM format'), findsOneWidget);
  });
}
