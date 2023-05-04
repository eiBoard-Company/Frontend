import 'package:eiboard_flutter/pages/calendar_screen.dart';
import 'package:eiboard_flutter/pages/components/calendar.dart';
import 'package:eiboard_flutter/pages/components/cards_main_screen.dart';
import 'package:eiboard_flutter/pages/components/custom_app_bar.dart';
import 'package:eiboard_flutter/pages/components/todo_box_main.dart';
import 'package:eiboard_flutter/pages/components/todo_list_box.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Hello eiCompany!",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
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
                          textInCardMiddle: '2',
                          textInCardBottom: 'Exams',
                          colorOfCard: LightStandardTheme.colorPrimary,
                          widthOfCard: 117,
                          heightOfCard: 121,
                          colorOfText: Colors.white,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const CalendarScreen();
                              },
                            ));
                          },
                        ),
                        const SizedBox(height: 17),
                        CardOnMainScreen(
                          textInCardTop: 'Assignments',
                          textInCardMiddle: '21%',
                          textInCardBottom: 'completed',
                          colorOfCard: LightStandardTheme.colorMain,
                          widthOfCard: 117,
                          heightOfCard: 121,
                          colorOfText: Colors.black,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const CalendarScreen();
                              },
                            ));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    const TodoBoxMainScreen(
                      textInCardTop: 'Todos',
                      todo: TodoListBox.withSize(
                        "Matheaufgaben erledigen",
                        "Mathematik II",
                        "Oct 17",
                        LightStandardTheme.colorClassThree,
                        186,
                        58,
                        10,
                        8,
                        false,
                      ),
                    ),
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