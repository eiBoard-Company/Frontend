import 'package:eiboard_flutter/pages/components/ListButton.dart';
import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:eiboard_flutter/pages/components/todoListBox.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class newTodoListScreen extends StatelessWidget {
  const newTodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'Tasks',
        child: Column(
          children: [
            Center(
                child: Text(
              'Overdue',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: LightStandardTheme.colorOverdue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            )),
            const SizedBox(height: 15),
            Center(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const newTodoListScreen();
                          },
                        ),
                      );
                    },
                    child: const todoListBox("test1", "Rechnerarchitektur",
                        "Oct 17", LightStandardTheme.colorClassThree))),
            const SizedBox(height: 15),
            Center(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const newTodoListScreen();
                          },
                        ),
                      );
                    },
                    child: const todoListBox("test1", "Rechnerarchitektur",
                        "Oct 17", LightStandardTheme.colorClassThree))),
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
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const newTodoListScreen();
                          },
                        ),
                      );
                    },
                    child: const todoListBox(
                        "Typ3-grammatik lernen",
                        "Formale Sprachen",
                        "Nov 21",
                        LightStandardTheme.colorClassTwo))),
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
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const newTodoListScreen();
                          },
                        ),
                      );
                    },
                    child: const todoListBox("Project", "Software Enineering",
                        "Nov 25", LightStandardTheme.colorClassOne))),
            const SizedBox(height: 150),
            Button(
              'Create Tasks',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const newTodoListScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}
