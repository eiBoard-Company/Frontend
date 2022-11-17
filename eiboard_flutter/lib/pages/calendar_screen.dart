import 'dart:collection';
import 'dart:html';

import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:eiboard_flutter/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/light_standard_theme.dart';

class CalendarScreen extends State<test> {
  List days = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
  List<Widget> mywidgets = [];
  final Map<Widget, bool> buttons = HashMap();
  bool done = false;
  int counter = 0;
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

    var i = 0;

    var buttonActive = true;
    Color c = Colors.white;
    for (var d in days) {
      var button;

      button = TextButton(
        onPressed: () => {},
        /**     print(buttonActive),
          setState(() => {
                print(c),
                buttonActive = !buttonActive,
                c = buttonActive == true
                    ? LightStandardTheme.colorSecondary
                    : Colors.white,
              }),
        },*/
        child: Text(d),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                buttonActive = !buttonActive;

                c = buttonActive == false
                    ? LightStandardTheme.colorSecondary
                    : Colors.white;
              } //<-- SEE HERE
              return c; // Defer to the widget's default.
            },
          ),
        ),
        // style: TextButton.styleFrom(

        // shape:
        //    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //backgroundColor: c,

        /** 
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: buttonActive == true
                  ? LightStandardTheme.colorSecondary
                  : Colors.white));
                  */
      );
      buttons[button] = false;

      i++;
      if (!done) {
        mywidgets.add(Expanded(child: button));
      }
    }
    done = true;
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
