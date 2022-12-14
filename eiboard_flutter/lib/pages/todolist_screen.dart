import 'package:eiboard_flutter/pages/components/ListButton.dart';
import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'Tasks',
        child: Column(children: [
          Center(
              child: Column(
            children: [
              const SizedBox(height: 20),
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
              Listbutton('Do math homework', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TodoListScreen();
                    },
                  ),
                );
              }, LightStandardTheme.colorClassThree, 'Mathematik ||', 'Oct 17'),
              const SizedBox(height: 37),
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
              Listbutton('Review last lecture', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TodoListScreen();
                    },
                  ),
                );
              }, LightStandardTheme.colorClassTwo, 'Rechnerarchitektur |',
                  'Oct 20'),
              const SizedBox(height: 37),
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
              Listbutton('Write blog post for this week', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TodoListScreen();
                    },
                  ),
                );
              }, LightStandardTheme.colorClassOne, 'Software Engineering',
                  'Oct 23'),
              const SizedBox(height: 15),
              Listbutton('Comment on other blogs', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TodoListScreen();
                    },
                  ),
                );
              }, LightStandardTheme.colorClassOne, 'Software Engineering',
                  'Oct 25'),
              const SizedBox(height: 180),
              Button(
                'Create Tasks',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TodoListScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          )),
        ]));
  }
}
