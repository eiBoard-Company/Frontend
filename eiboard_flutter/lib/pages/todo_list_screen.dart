import 'package:intl/intl.dart';
import '/../pages/components/button.dart';
import '/../pages/components/page.dart';
import '/../pages/components/todo_list_box.dart';
import '/../pages/create_task_screen.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/../pages/components/task_List_Object.dart';
import 'singletask_screen.dart';

// ignore: must_be_immutable
class TodoListScreen extends StatelessWidget {
  TodoListScreen({Key? key}) : super(key: key);
  var today = DateTime.now();
  String formatter = '';
  List<TaskListObject> tasks = [
    TaskListObject(
        taskname: "Project",
        subject: "Software Engineering",
        time: DateTime(2023, 06, 19),
        completeValue: 0.0,
        description: "Präsentation vorbereiten",
        dueValue: "Due Today",
        typId: "2"),
    TaskListObject(
        taskname: "Netztechnik lernen",
        subject: "Netztechnik",
        time: DateTime(2023, 06, 21),
        completeValue: 0.0,
        description: "lernen",
        dueValue: "Due This Week",
        typId: "3"),
    TaskListObject(
        taskname: "Datenbanken lernen",
        subject: "Datenbanken",
        time: DateTime(2023, 06, 12),
        completeValue: 0.0,
        description: "",
        dueValue: "Overdue",
        typId: "4"),
  ];

  @override
  Widget build(BuildContext context) {
    formatter = DateFormat('MMMMd').format(today);
    List<TaskListObject> overdueTasks =
        tasks.where((task) => task.dueValue == 'Overdue').toList();
    List<TaskListObject> dueTodayTasks =
        tasks.where((task) => task.dueValue == 'Due Today').toList();
    List<TaskListObject> dueThisWeekTasks =
        tasks.where((task) => task.dueValue == 'Due This Week').toList();

    return PageBackground(
        topic: 'Tasks',
        showPlusIcon: false,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            if (overdueTasks.isNotEmpty) ...[
              Text(
                'Overdue',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: LightStandardTheme.colorOverdue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              for (var task in overdueTasks)
                Column(
                  children: [
                    Center(
                      child: TodoListBox(
                        task.taskname ?? '-',
                        task.subject ?? '-',
                        task.time != null
                            ? DateFormat('MMMMd').format(task.time!)
                            : '-',
                        LightStandardTheme.colorClassThree,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SingleTaskScreen(
                                    typeId: task.typId ?? '-');
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15)
                  ],
                )
            ],
            if (dueTodayTasks.isNotEmpty) ...[
              Text(
                'Due Today',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: LightStandardTheme.colorDueToday,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              for (var task in dueTodayTasks)
                Column(
                  children: [
                    Center(
                      child: TodoListBox(
                        task.taskname ?? '-',
                        task.subject ?? '-',
                        task.time != null
                            ? DateFormat('MMMMd').format(task.time!)
                            : '-',
                        LightStandardTheme.colorClassTwo,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SingleTaskScreen(
                                    typeId: task.typId ?? '-');
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15)
                  ],
                ),
            ],
            if (dueThisWeekTasks.isNotEmpty) ...[
              Text(
                'Due This Week',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: LightStandardTheme.colorDueThisWeek,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              for (var task in dueThisWeekTasks)
                Column(
                  children: [
                    Center(
                      child: TodoListBox(
                        task.taskname ?? '-',
                        task.subject ?? '-',
                        task.time != null
                            ? DateFormat('MMMMd').format(task.time!)
                            : '-',
                        LightStandardTheme.colorClassOne,
                        () {
                          if (task.dueValue != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SingleTaskScreen(
                                      typeId: task.typId ?? '-');
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 15)
                  ],
                )
            ],
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Button(
                    'Create Task',
                    () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CreateTaskScreen();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
