import 'package:eiboard_flutter/pages/components/page.dart';
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
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      topic: 'Schedule',
      showPlusIcon: true,
      child: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: SfCalendar(
              controller: _calendarController,
              timeSlotViewSettings: const TimeSlotViewSettings(
                startHour: 0,
                endHour: 24,
              ),
              view: CalendarView.week,
              allowedViews: const [
                CalendarView.day,
                CalendarView.week,
                CalendarView.month
              ],
              headerHeight: 40,
              headerStyle: const CalendarHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              todayHighlightColor: LightStandardTheme.colorSecondary,
              dataSource: _getCalendarData(),
              initialDisplayDate: DateTime.now(),
              onTap: calendarTapped,
              monthViewSettings: const MonthViewSettings(
                navigationDirection: MonthNavigationDirection.vertical,
              ),
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
                      //TODO: adjust font sizes to screen size
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

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (_calendarController.view == CalendarView.month &&
        calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      _calendarController.view = CalendarView.day;
    } else if ((_calendarController.view == CalendarView.week ||
            _calendarController.view == CalendarView.workWeek) &&
        calendarTapDetails.targetElement == CalendarElement.viewHeader) {
      _calendarController.view = CalendarView.day;
    }
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

_AppointmentDataSource _getCalendarData() {
  List<Appointment> classes = <Appointment>[];
  classes.add(Appointment(
    startTime: DateTime.parse('2023-04-18 08:30:00Z'),
    endTime: DateTime.parse('2023-04-18 12:30:00Z'),
    subject: 'Software Engineering',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassOne,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-04-18 13:00:00Z'),
    endTime: DateTime.parse('2023-04-18 16:15:00Z'),
    subject: 'Formale Sprachen',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassTwo,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-04-19 08:30:00Z'),
    endTime: DateTime.parse('2023-04-19 11:00:00Z'),
    subject: 'Rechnerarchitektur I',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassThree,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-04-20 12:00:00Z'),
    endTime: DateTime.parse('2023-04-20 14:30:00Z'),
    subject: 'Betriebssysteme',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassFour,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-04-21 08:30:00Z'),
    endTime: DateTime.parse('2023-04-21 11:45:00Z'),
    subject: 'Mathematik II',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassFive,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-04-21 12:30:00Z'),
    endTime: DateTime.parse('2023-04-21 15:45:00Z'),
    subject: 'Datenbanken I',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassSix,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-04-22 08:45:00Z'),
    endTime: DateTime.parse('2023-04-22 12:00:00Z'),
    subject: 'Webengineering II',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassSeven,
  ));

  return _AppointmentDataSource(classes);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
