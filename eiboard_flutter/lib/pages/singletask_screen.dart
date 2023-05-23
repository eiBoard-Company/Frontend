import 'package:date_field/date_field.dart';
import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/light_standard_theme.dart';
import 'components/task_List_Object.dart';

class SingleTaskScreen extends StatefulWidget {
  final String typeId;
  const SingleTaskScreen({Key? key, required this.typeId}) : super(key: key);

  @override
  State<SingleTaskScreen> createState() => _SingleTaskScreen();
}

class _SingleTaskScreen extends State<SingleTaskScreen> {
  bool bearbeitet = false;
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

  @override
  Widget build(BuildContext context) {
    String typeId = widget.typeId;

    // Find the task object with matching typeId
    TaskListObject task = tasks.firstWhere((task) => task.typId == typeId);
    double sliderValue = task.completeValue ?? 0.0;
    // Helper method to determine color based on dueValue
    Color _getColorForDueValue(String? dueValue) {
      switch (dueValue) {
        case 'Due Today':
          return LightStandardTheme.colorDueToday;
        case 'Due This Week':
          return LightStandardTheme.colorDueThisWeek;
        case 'Overdue':
          return LightStandardTheme.colorOverdue;
        default:
          return Colors.black; // Default color
      }
    }

    return PageBackground(
        topic: 'Task',
        showPlusIcon: false,
        child: Center(
            child: Container(
          width: 337,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // hier hinzugefügt
              crossAxisAlignment: CrossAxisAlignment.start, // hier hinzugefügt
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
                      child: DateTimeFormField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              color: LightStandardTheme.colorLightFont,
                              fontSize: 12),
                          errorStyle: TextStyle(
                              color: LightStandardTheme.colorError,
                              fontSize: 12),
                        ),
                        mode: DateTimeFieldPickerMode.time,
                        autovalidateMode: AutovalidateMode.always,
                        enabled: bearbeitet,
                        initialValue: task.time,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      task.dueValue ?? '-',
                      style: TextStyle(
                        color: _getColorForDueValue(task.dueValue),
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
                  decoration: InputDecoration(
                    enabled: bearbeitet,
                  ),
                ),
                const SizedBox(height: 20),
                Text('${sliderValue.toStringAsFixed(0)}% complete'),
                Slider(
                  value: sliderValue,
                  min: 0.0,
                  max: 100.0,
                  divisions: 5,
                  label: sliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  activeColor: LightStandardTheme.colorSecondary,
                  inactiveColor: LightStandardTheme.colorPrimary,
                ),
              ]),
        )));
  }
}
