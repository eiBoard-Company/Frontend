import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:eiboard_flutter/pages/components/todo_list_box.dart';
import 'package:eiboard_flutter/pages/create_task_screen.dart';
import 'package:eiboard_flutter/pages/singletask_screen.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTodoListScreen extends StatelessWidget {
  const NewTodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'Tasks',
        showPlusIcon: false,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Overdue',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: LightStandardTheme.colorOverdue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            Center(
                child: TodoListBox("Matheaufgaben erledigen", "Mathematik II",
                    "Oct 17", LightStandardTheme.colorClassThree, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SliderExample();
                  },
                ),
              );
            })),
            const SizedBox(height: 15),
            Center(
                child: TodoListBox(
                    "Letzte Vorlesung nacharbeiten",
                    "Rechnerarchitektur",
                    "Oct 17",
                    LightStandardTheme.colorClassThree, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NewTodoListScreen();
                  },
                ),
              );
            })),
            const SizedBox(height: 15),
            Text(
              'Due Today',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: LightStandardTheme.colorDueToday,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            Center(
                child: TodoListBox("Typ3-grammatik lernen", "Formale Sprachen",
                    "Nov 21", LightStandardTheme.colorClassTwo, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NewTodoListScreen();
                  },
                ),
              );
            })),
            const SizedBox(height: 15),
            Text(
              'Due This Week',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: LightStandardTheme.colorDueThisWeek,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            Center(
                child: TodoListBox("Project", "Software Enineering", "Nov 25",
                    LightStandardTheme.colorClassOne, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NewTodoListScreen();
                  },
                ),
              );
            })),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Button(
                    'Create Task',
                    () {
                      Navigator.push(
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
