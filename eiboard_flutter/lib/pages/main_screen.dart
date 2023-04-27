import 'package:eiboard_flutter/pages/calendar_screen.dart';
import 'package:eiboard_flutter/pages/components/cards_main_screen.dart';
import 'package:eiboard_flutter/pages/components/custom_app_bar.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';

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
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20.0,
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
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
