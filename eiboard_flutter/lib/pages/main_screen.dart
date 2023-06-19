import 'package:intl/intl.dart';

import '../utils/user_preferences.dart';
import '/../pages/components/calendar.dart';
import '/../pages/components/cards_main_screen.dart';
import '/../pages/components/custom_app_bar.dart';
import '/../pages/components/todo_box_main.dart';
import '/../pages/components/todo_list_box.dart';
import '/../pages/components/task_List_Object.dart';
import 'singletask_screen.dart';
import 'todo_list_screen.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final user = UserPreferences.user;
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
    List<TaskListObject> overdueTasks =
        tasks.where((task) => task.dueValue == 'Overdue').toList();
    List<TaskListObject> dueTodayTasks =
        tasks.where((task) => task.dueValue == 'Due Today').toList();
    List<TaskListObject> dueThisWeekTasks =
        tasks.where((task) => task.dueValue == 'Due This Week').toList();

    List<TodoListBox> todoBoxes = [];
    int maxTodoBoxes = 3;
    int todoCount = 0;

    for (TaskListObject task in overdueTasks) {
      if (todoCount >= maxTodoBoxes) break;

      todoBoxes.add(
        TodoListBox.withSize(
          task.subject ?? '-',
          DateFormat('MMM d').format(task.time ?? DateTime.now()),
          task.dueValue ?? '-',
          LightStandardTheme.colorClassThree,
          186,
          58,
          10,
          8,
          false,
          () {
            if (task.dueValue != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SingleTaskScreen(typeId: task.typId ?? '-');
                  },
                ),
              );
            }
          },
        ),
      );

      todoCount++;
    }

    for (TaskListObject task in dueTodayTasks) {
      if (todoCount >= maxTodoBoxes) break;

      todoBoxes.add(
        TodoListBox.withSize(
          task.subject ?? '-',
          DateFormat('MMM d').format(task.time ?? DateTime.now()),
          task.dueValue ?? '-',
          LightStandardTheme.colorClassTwo,
          186,
          58,
          10,
          8,
          false,
          () {
            if (task.dueValue != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SingleTaskScreen(typeId: task.typId ?? '-');
                  },
                ),
              );
            }
          },
        ),
      );

      todoCount++;
    }

    for (TaskListObject task in dueThisWeekTasks) {
      if (todoCount >= maxTodoBoxes) break;

      todoBoxes.add(
        TodoListBox.withSize(
          task.subject ?? '-',
          DateFormat('MMM d').format(task.time ?? DateTime.now()),
          task.dueValue ?? '-',
          LightStandardTheme.colorClassOne,
          186,
          58,
          10,
          8,
          false,
          () {
            if (task.dueValue != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SingleTaskScreen(typeId: task.typId ?? '-');
                  },
                ),
              );
            }
          },
        ),
      );

      todoCount++;
    }

    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Hello ${user.firstName.isNotEmpty ? user.firstName : 'You'}!",
                style: const TextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CardOnMainScreen(
                          textInCardTop: 'Upcoming',
                          textInCardMiddle: '3',
                          textInCardBottom: 'Exams',
                          colorOfCard: LightStandardTheme.colorPrimary,
                          widthOfCard: 117,
                          heightOfCard: 121,
                          colorOfText: Colors.white,
                          onTap: () {
                            /*Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const CalendarScreen();
                              },
                            ));*/
                          },
                        ),
                        const SizedBox(height: 17),
                        CardOnMainScreen(
                          textInCardTop: 'Assignments',
                          textInCardMiddle: '0%',
                          textInCardBottom: 'completed',
                          colorOfCard: LightStandardTheme.colorMain,
                          widthOfCard: 117,
                          heightOfCard: 121,
                          colorOfText: Colors.black,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return TodoListScreen();
                              },
                            ));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    TodoBoxMainScreen(
                      textInCardTop: 'Tasks',
                      todos: todoBoxes,
                      page: TodoListScreen(),
                    )
                  ],
                ),
              ),
            ),
            const Flexible(
              child: CustomCalendar(
                heightOfCalendar: 400,
                customAllowedViews: [
                  CalendarView.day,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
