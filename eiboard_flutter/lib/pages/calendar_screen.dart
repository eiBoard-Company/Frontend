import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/light_standard_theme.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    List months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    List days = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
    List<Widget> mywidgets = [];
    for (var d in days) {
      mywidgets
          .add(Expanded(child: TextButton(onPressed: () {}, child: Text(d))));
    }

    return PageBackground(
        topic: 'Schedule',
        child: Column(children: [
          Center(
              child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                months[now.month - 1],
                style: GoogleFonts.karla(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          )),
          Row(
            children: mywidgets,
          )
        ]));
  }
}
