import '/../pages/components/button.dart';
import '/../pages/components/page.dart';
import '/../pages/components/todo_list_box.dart';
import '/../pages/create_task_screen.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'Tasks',
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
                    return const TodoListScreen();
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
                    return const TodoListScreen();
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
                    return const TodoListScreen();
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
                    return const TodoListScreen();
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
