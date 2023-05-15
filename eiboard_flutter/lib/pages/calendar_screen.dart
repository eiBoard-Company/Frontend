import '/../pages/components/calendar.dart';
import '/../pages/components/page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'create_event_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return PageBackground.withPlusIcon(
      topic: 'Schedule',
      showPlusIcon: true,
      pageForPlus: const CreateEventScreen(),
      child: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        CustomCalendar(
          heightOfCalendar: MediaQuery.of(context).size.height - 100,
          customAllowedViews: const [
            CalendarView.day,
            CalendarView.week,
            CalendarView.month
          ],
        ),
      ])),
    );
  }
}
