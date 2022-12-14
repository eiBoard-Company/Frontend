import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:eiboard_flutter/pages/weekly_calendar_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../themes/light_standard_theme.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime displayDate = DateTime.now().add(
    const Duration(days: 30),
  );

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
              Text(
                "${listOfMonths[selectedDate.month - 1]} ${selectedDate.year}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_horiz,
                    color: LightStandardTheme.colorPrimary, size: 28),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarWeeklyScreen()),
                  );
                },
              ),
            ],
          ),
        ),
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
                      selectedDate = DateTime.now().add(Duration(days: index));
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
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height -
                (2 * 65) -
                30 -
                25 -
                1 -
                50,
            child: SfCalendar(
              timeSlotViewSettings: const TimeSlotViewSettings(
                startHour: 0,
                endHour: 24,
              ),
              view: CalendarView.day,
              headerHeight: 0,
              headerStyle: const CalendarHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              todayHighlightColor: LightStandardTheme.colorSecondary,
              dataSource: ClassDataSource(getAppointments()),
              appointmentBuilder:
                  (context, CalendarAppointmentDetails details) {
                final Appointment meeting = details.appointments.first;
                return Container(
                    padding: const EdgeInsets.all(15),
                    height: 50,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(13),
                      color: meeting.color,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(meeting.notes.toString(),
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                )),
                            const Spacer(),
                            const Icon(Icons.location_on,
                                color: Colors.black, size: 14),
                            Text(" ${meeting.location}",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                        const Spacer(),
                        Text(meeting.subject,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(getTime(details),
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            )),
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
