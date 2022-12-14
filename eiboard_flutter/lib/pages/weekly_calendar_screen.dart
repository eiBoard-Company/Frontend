import 'dart:developer';
import 'package:eiboard_flutter/pages/calendar_screen.dart';
import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../themes/light_standard_theme.dart';

class CalendarWeeklyScreen extends StatefulWidget {
  const CalendarWeeklyScreen({Key? key}) : super(key: key);

  @override
  State<CalendarWeeklyScreen> createState() => _CalendarWeeklyScreenState();
}

class _CalendarWeeklyScreenState extends State<CalendarWeeklyScreen> {
  int currentDateSelectedIndex = 0;
  ScrollController scrollController = ScrollController();

  DateTime now = DateTime.now();
  Text header = updateHeader(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return PageBackground(
      topic: 'Schedule',
      child: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Row(
            children: [
              const Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 28,
              ),
              const Spacer(),
              header,
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_horiz,
                    color: LightStandardTheme.colorPrimary, size: 28),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height - (2 * 65) - 20 - 100,
            child: SfCalendar(
              /*onViewChanged: (ViewChangedDetails details) { //TODO: fix error that's occuring here
                List<DateTime> dates = details.visibleDates;
                log(dates.elementAt(0).toString());
                now = dates.elementAt(0);
                setState(() {
                  header = updateHeader(now);
                });
              },*/
              timeSlotViewSettings: const TimeSlotViewSettings(
                startHour: 0,
                endHour: 24,
              ),
              view: CalendarView.workWeek,
              headerHeight: 0,
              todayHighlightColor: LightStandardTheme.colorSecondary,
              dataSource: ClassDataSource(getAppointments()),
              appointmentBuilder:
                  (context, CalendarAppointmentDetails details) {
                final Appointment meeting = details.appointments.first;
                return Container(
                    padding: const EdgeInsets.fromLTRB(5, 7, 5, 8),
                    height: 50,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6),
                      color: meeting.color,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(meeting.subject,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 8,
                            )),
                        const Spacer(),
                        Text(getTime(details),
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 6,
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: Colors.black, size: 8),
                            Text(" ${meeting.location}",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 6,
                                )),
                          ],
                        ),
                      ],
                    ));
              },
            ))
      ])),
    );
  }
}

String getTime(CalendarAppointmentDetails details) {
  final Appointment meeting = details.appointments.first;

  if (meeting.startTime.minute < 2 && meeting.endTime.minute < 2) {
    return "${meeting.startTime.hour}:${meeting.startTime.minute}0 - ${meeting.endTime.hour}:${meeting.endTime.minute}0";
  } else if (meeting.startTime.minute < 2) {
    return "${meeting.startTime.hour}:${meeting.startTime.minute}0 - ${meeting.endTime.hour}:${meeting.endTime.minute}";
  } else if (meeting.endTime.minute < 2) {
    return "${meeting.startTime.hour}:${meeting.startTime.minute} - ${meeting.endTime.hour}:${meeting.endTime.minute}0";
  } else {
    return "${meeting.startTime.hour}:${meeting.startTime.minute} - ${meeting.endTime.hour}:${meeting.endTime.minute}";
  }
}

List<Appointment> getAppointments() {
  List<Appointment> classes = <Appointment>[];

  classes.add(Appointment(
    startTime: DateTime.parse('2022-12-15 08:30:00Z'),
    endTime: DateTime.parse('2022-12-15 12:30:00Z'),
    subject: 'Software Engineering',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassOne,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2022-12-15 13:00:00Z'),
    endTime: DateTime.parse('2022-12-15 16:15:00Z'),
    subject: 'Formale Sprachen',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassTwo,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2022-12-14 08:30:00Z'),
    endTime: DateTime.parse('2022-12-14 11:00:00Z'),
    subject: 'Rechnerarchitektur I',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassThree,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2022-12-14 12:00:00Z'),
    endTime: DateTime.parse('2022-12-14 14:30:00Z'),
    subject: 'Betriebssysteme',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassFour,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2022-12-12 08:30:00Z'),
    endTime: DateTime.parse('2022-12-12 11:45:00Z'),
    subject: 'Mathematik II',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassFive,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2022-12-12 12:30:00Z'),
    endTime: DateTime.parse('2022-12-12 15:45:00Z'),
    subject: 'Datenbanken I',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassSix,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2022-12-16 08:45:00Z'),
    endTime: DateTime.parse('2022-12-16 12:00:00Z'),
    subject: 'Webengineering II',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassSeven,
  ));

  return classes;
}

class ClassDataSource extends CalendarDataSource {
  ClassDataSource(List<Appointment> source) {
    appointments = source;
  }
}

Text updateHeader(DateTime now) {
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

  return Text(
    "${listOfMonths[now.month - 1]} ${now.year} ",
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  );
}
