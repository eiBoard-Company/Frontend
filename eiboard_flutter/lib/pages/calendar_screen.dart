import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/light_standard_theme.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();

  int currentDateSelectedIndex = 0;
  ScrollController scrollController = ScrollController();

  List<String> listOfMonths = [
    "January",
    "Feburary",
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
  List<String> listOfDays = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'Schedule',
        child: Column(children: [
          const SizedBox(
            height: 25,
          ),
          Center(
              child: Text(
            "${listOfMonths[selectedDate.month - 1]} ${selectedDate.year}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          )),
          const SizedBox(height: 30),
          SizedBox(
              height: 65,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
                itemCount: 365,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentDateSelectedIndex = index;
                        selectedDate =
                            DateTime.now().add(Duration(days: index));
                      });
                    },
                    child: Container(
                      height: 65,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: currentDateSelectedIndex == index
                              ? LightStandardTheme.colorSecondary
                              : Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateTime.now()
                                .add(Duration(days: index))
                                .day
                                .toString(),
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: currentDateSelectedIndex == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            listOfDays[DateTime.now()
                                        .add(Duration(days: index))
                                        .weekday -
                                    1]
                                .toString(),
                            style: TextStyle(
                                fontSize: 12,
                                color: currentDateSelectedIndex == index
                                    ? Colors.white
                                    : const Color(0xFF717171)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
        ]));
  }
}
