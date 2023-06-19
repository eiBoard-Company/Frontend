import 'dart:convert';

import 'package:eiboard_flutter/pages/components/backend_rapla.dart';
import 'package:provider/provider.dart';

import '../model/date_time_formatter.dart';
import '../utils/auth_provider.dart';
import '/../pages/components/page.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';

import '/../pages/components/button.dart';

import '/../pages/components/custom_date_picker.dart';
import '/../pages/components/custom_text_form_field.dart';
import '/../pages/components/custom_time_picker.dart';
import 'todo_list_screen.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  List<String> tags = [
    'Software Engineering',
    'Formale Sprachen',
    'Mathematik II',
    'Datenbanken I',
    'Webengineering II',
    'Betriebssysteme',
    'Rechnerarchitektur I'
  ];
  int tag1 = 0;
  String newTag = '';
  final _chipController = TextEditingController();
  final _dateController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? userID;
  String? bearerToken;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    userID = authProvider.userID;
    bearerToken = authProvider.bearerToken;
  }

  void createTask() {
    final String title = _titleController.text;
    final String date = _dateController.text;
    final String endTime = _endTimeController.text;
    final String description = _descriptionController.text;
    final String category = tags[tag1];

    final taskObject = {
      'taskname': title,
      'description': description,
      'time': DateTimeFormatter.formatDateTime(date, endTime).toIso8601String(),
      'subject': category,
      'completeValue': 0.0,
      'personId': int.parse(userID!),
    };

    final taskjson = jsonEncode(taskObject);

    HttpRequest.createTask(bearerToken!, context, taskjson);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return PageBackground(
        topic: 'Create New Task',
        child: Form(
          key: formKey,
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              labelText: 'Title',
              controller: _titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field can not be empty';
                }
                return null;
              },
            ),
            CustomDatePicker(controller: _dateController, labelText: 'Date'),
            CustomTimePicker(
              controller: _endTimeController,
              labelText: 'End Time',
              width: 337,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field can not be empty';
                }
                const pattern = r'^\d{1,2}:\d{2} [AP]M$';
                final regex = RegExp(pattern);
                if (!regex.hasMatch(value)) {
                  return 'Use HH:MM AM/PM format';
                }
                return null;
              },
            ),
            CustomTextFormField(
              labelText: 'Description',
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 4,
              controller: _descriptionController,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 337,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Category'),
                  const SizedBox(height: 10.0),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 7.0,
                    children: List<Widget>.generate(
                      tags.length,
                      (index) => ChoiceChip(
                        label: Text(tags[index]),
                        selected: tag1 == index,
                        selectedColor: LightStandardTheme.colorDueToday,
                        backgroundColor: LightStandardTheme.colorDarkFont,
                        labelStyle: TextStyle(
                          color: tag1 == index
                              ? Colors.white
                              : LightStandardTheme.colorLightFont,
                        ),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: tag1 == index
                                  ? LightStandardTheme.colorDueToday
                                  : LightStandardTheme.tagBorder,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        onSelected: (bool selected) {
                          setState(() {
                            tag1 = (selected ? index : null)!;
                          });
                        },
                      ),
                    ).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 337,
              child: Row(children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    cursorColor: LightStandardTheme.colorPrimary,
                    controller: _chipController,
                    decoration: const InputDecoration(
                      hintText: 'New Category',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) => setState(() => newTag = value),
                    onSubmitted: (value) {
                      _chipController.clear();
                      setState(() {
                        tags.add(newTag);
                        newTag = '';
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _chipController.clear();
                    setState(() {
                      tags.add(newTag);
                      newTag = '';
                    });
                  },
                ),
              ]),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Button(
                    'Create Task',
                    () {
                      if (formKey.currentState!.validate()) {
                        createTask();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const TodoListScreen();
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
