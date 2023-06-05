import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../model/date_time_formatter.dart';
import '/../pages/components/page.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';

import 'calendar_screen.dart';
import 'components/button.dart';

import 'components/custom_date_picker.dart';
import 'components/custom_text_form_field.dart';
import 'components/custom_time_picker.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  List<String> tags = [
    'Private',
    'Lecture',
    'Doctor',
    'Studying',
  ];
  int tag1 = 0;
  String newTag = '';
  final _dateController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _chipController = TextEditingController();
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void createEvent() {
    final String title = _titleController.text;
    final String date = _dateController.text;
    final String startTime = _startTimeController.text;
    final String endTime = _endTimeController.text;
    final String location = _locationController.text;
    final String description = _descriptionController.text;
    final String category = tags[tag1];

    Appointment event = Appointment(
        subject: title,
        location: location,
        notes: category,
        startTime: DateTimeFormatter.formatDateTime(date, startTime),
        endTime: DateTimeFormatter.formatDateTime(date, endTime),
        color: LightStandardTheme.colorClassFive);
  }

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'Create New Event',
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
            CustomDatePicker(
              controller: _dateController,
              labelText: 'Date',
            ),
            SizedBox(
                width: 337,
                child: Row(children: [
                  CustomTimePicker(
                    controller: _startTimeController,
                    labelText: 'Start Time',
                    width: 155,
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
                  const SizedBox(
                    width: 27,
                  ),
                  CustomTimePicker(
                      controller: _endTimeController,
                      labelText: 'End Time',
                      width: 155,
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
                      }),
                ])),
            CustomTextFormField(
              labelText: 'Location',
              controller: _locationController,
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
                    'Create Event',
                    () {
                      if (formKey.currentState!.validate()) {
                        createEvent();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const CalendarScreen();
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
