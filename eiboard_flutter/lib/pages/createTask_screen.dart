import 'dart:html';

import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:eiboard_flutter/pages/components/tagButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/button.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({Key? key}) : super(key: key);
  List<String> tags = [
    'Software Engineering',
    'Formale Sprachen',
    'Mathematik II',
    'Datenbanken I',
    'Webengineering II',
    'Betriebssysteme',
    'Rechnerarchitektur I'
  ];
  int tag = 1;

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      topic: 'Create New Task',
      child: Column(children: [
        SizedBox(
          width: 337,
          child: TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Title'),
          ),
        ),
        SizedBox(
            width: 337,
            child: DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                suffixIcon: Icon(Icons.date_range),
                labelText: 'Date',
              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                print(value);
              },
            )),
        SizedBox(
            width: 337,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 202, 0),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      labelText: 'Start Time',
                    ),
                    mode: DateTimeFieldPickerMode.time,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                        (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {
                      print(value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(202, 0, 0, 0),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      labelText: 'End Time',
                    ),
                    mode: DateTimeFieldPickerMode.time,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                        (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {
                      print(value);
                    },
                  ),
                )
              ],
            )),
        SizedBox(
          width: 337,
          child: TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
          ),
        ),
        const SizedBox(width: 337, child: tagButton("test")),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Button(
            'Create Tasks',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CreateTaskScreen();
                  },
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
