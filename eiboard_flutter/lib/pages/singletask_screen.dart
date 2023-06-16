import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/light_standard_theme.dart';
import '/../pages/components/button.dart';
import '/../pages/components/custom_date_picker.dart';
import '/../pages/components/page.dart';
import '/../pages/components/task_List_Object.dart';

class SingleTaskScreen extends StatefulWidget {
  final String typeId;
  const SingleTaskScreen({Key? key, required this.typeId}) : super(key: key);

  @override
  State<SingleTaskScreen> createState() => _SingleTaskScreen();
}

class _SingleTaskScreen extends State<SingleTaskScreen> {
  bool bearbeitet = false;
  final formKey = GlobalKey<FormState>();
  List<TaskListObject> tasks = [
    TaskListObject(
        taskname: "Matheaufgaben erledigen",
        subject: "Mathematik II",
        time: DateTime.now(),
        completeValue: 0.0,
        description: "Test",
        dueValue: "Overdue",
        typId: "1"),
    TaskListObject(
        taskname: "Project",
        subject: "Software Engineering",
        time: DateTime.now(),
        completeValue: 0.0,
        description: "Test2",
        dueValue: "Due This Week",
        typId: "2"),
    TaskListObject(
        taskname: "Type3-Grammatik lernen",
        subject: "Formale Sprachen",
        time: DateTime.now(),
        completeValue: 0.0,
        description: "Test3",
        dueValue: "Due Today",
        typId: "3"),
    TaskListObject(
        taskname: "Datenbanken lernen",
        subject: "Datenbanken",
        time: DateTime.now(),
        completeValue: 0.0,
        description: "Test4",
        dueValue: "Overdue",
        typId: "4"),
  ];
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String typeId = widget.typeId;

    TaskListObject task = tasks.firstWhere((task) => task.typId == typeId);
    double sliderValue = task.completeValue ?? 0.0;
    Color getColorForDueValue(String? dueValue) {
      switch (dueValue) {
        case 'Due Today':
          return LightStandardTheme.colorDueToday;
        case 'Due This Week':
          return LightStandardTheme.colorDueThisWeek;
        case 'Overdue':
          return LightStandardTheme.colorOverdue;
        default:
          return Colors.black;
      }
    }

    return PageBackground(
        topic: 'Task',
        showPlusIcon: false,
        child: Center(
            child: SizedBox(
                width: 337,
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          task.taskname ?? '-',
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: LightStandardTheme.colorLightFont,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              task.subject ?? '-',
                              style: const TextStyle(
                                  color: LightStandardTheme.colorLightFont,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomDatePicker(
                                controller: _dateController,
                                labelText: 'Date',
                                disabled: !bearbeitet,
                                initialDate: task.time,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              task.dueValue ?? '-',
                              style: TextStyle(
                                color: getColorForDueValue(task.dueValue),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: TextEditingController()
                            ..text = task.description ?? '-',
                          onChanged: (text) => {},
                          cursorColor: LightStandardTheme.colorPrimary,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: LightStandardTheme.colorPrimary),
                            ),
                            enabled: bearbeitet,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text('${sliderValue.toStringAsFixed(0)}% complete'),
                        SliderTheme(
                          data: const SliderThemeData(
                              disabledThumbColor: LightStandardTheme.tagBorder,
                              disabledActiveTrackColor:
                                  LightStandardTheme.colorSecondary,
                              disabledInactiveTrackColor:
                                  LightStandardTheme.colorPrimary),
                          child: Slider(
                            value: sliderValue,
                            min: 0.0,
                            max: 100.0,
                            divisions: 5,
                            label: sliderValue.round().toString(),
                            onChanged: bearbeitet
                                ? (double value) {
                                    setState(() {
                                      task.completeValue = value;
                                    });
                                  }
                                : null,
                            onChangeEnd: (double value) {
                              setState(() {
                                task.completeValue = value;
                              });
                            },
                            activeColor: LightStandardTheme.colorSecondary,
                            inactiveColor: LightStandardTheme.colorPrimary,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Button(
                                bearbeitet ? 'Done' : 'Edit',
                                () {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      bearbeitet =
                                          !bearbeitet; // Toggle the editing state
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ]),
                ))));
  }
}
