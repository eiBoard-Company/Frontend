import '../single_event_screen.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CustomCalendar extends StatefulWidget {
  final double heightOfCalendar;
  final List<CalendarView>? customAllowedViews;

  const CustomCalendar({
    Key? key,
    required this.heightOfCalendar,
    required this.customAllowedViews,
  }) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = 12.0;
    double fontSizeSubject = 15.0;
    double iconSize = 14.0;
    double paddingOfEventBox = 15.0;

    if (screenWidth < 200 && _calendarController.view == CalendarView.day) {
      fontSize = 8.0;
      iconSize = 10.0;
      fontSizeSubject = 11.0;
    } else if (screenWidth < 620 &&
        _calendarController.view == CalendarView.week) {
      fontSize = 5.0;
      iconSize = 7.0;
      fontSizeSubject = 7.0;
      paddingOfEventBox = 9.0;
    } else if (screenWidth < 700 &&
        _calendarController.view == CalendarView.week) {
      fontSize = 6.0;
      iconSize = 8.0;
      fontSizeSubject = 7.0;
      paddingOfEventBox = 9.0;
    } else if (screenWidth < 900 &&
        _calendarController.view == CalendarView.week) {
      fontSize = 6.0;
      iconSize = 8.0;
      fontSizeSubject = 9.0;
    } else if (screenWidth < 1150 &&
        _calendarController.view == CalendarView.week) {
      fontSize = 8.0;
      iconSize = 10.0;
      fontSizeSubject = 11.0;
    }

    return SizedBox(
        height: widget.heightOfCalendar,
        child: SfCalendar(
          controller: _calendarController,
          timeSlotViewSettings: const TimeSlotViewSettings(
            startHour: 0,
            endHour: 24,
          ),
          view: CalendarView.day,
          allowedViews: widget.customAllowedViews,
          showDatePickerButton: true,
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
          appointmentBuilder: (context, CalendarAppointmentDetails details) {
            final Appointment meeting = details.appointments.first;
            return Container(
                padding: EdgeInsets.only(
                    bottom: 15,
                    top: 15,
                    left: paddingOfEventBox,
                    right: paddingOfEventBox),
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
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                meeting.notes.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: fontSize,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: Icon(
                                          Icons.location_on,
                                          color: Colors.black,
                                          size: iconSize,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "${meeting.location}",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: fontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      meeting.subject,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: fontSizeSubject,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      getTime(details),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ));
          },
        ));
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.appointment) {
      Appointment appointment = calendarTapDetails.appointments![0];
      SingleEventScreen.showAppointmentDialog(context, appointment);
    }
    if (_calendarController.view == CalendarView.month &&
        calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      _calendarController.view = CalendarView.day;
    } else if (_calendarController.view == CalendarView.week &&
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
    startTime: DateTime.parse('2023-06-19 13:00:00Z'),
    endTime: DateTime.parse('2023-06-19 17:00:00Z'),
    subject: 'Software Engineering',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassOne,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-06-20 09:00:00Z'),
    endTime: DateTime.parse('2023-06-20 12:15:00Z'),
    subject: 'Statistik',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassTwo,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-06-20 13:00:00Z'),
    endTime: DateTime.parse('2023-06-20 16:15:00Z'),
    subject: 'Kommunikations- und Netztechnik',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassThree,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-06-21 09:00:00Z'),
    endTime: DateTime.parse('2023-06-21 12:15:00Z'),
    subject: 'Compilerbau',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassFour,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-06-23 09:00:00Z'),
    endTime: DateTime.parse('2023-06-23 12:15:00Z'),
    subject: 'Workflow',
    notes: 'Lecture',
    location: 'F492',
    color: LightStandardTheme.colorClassFive,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-06-22 09:00:00Z'),
    endTime: DateTime.parse('2023-06-22 12:00:00Z'),
    subject: 'Klausur Netzwerktechnik (90min)',
    notes: 'Exam',
    location: 'F492',
    color: LightStandardTheme.colorClassSix,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-06-24 18:00:00Z'),
    endTime: DateTime.parse('2023-06-24 22:00:00Z'),
    subject: 'Meeting with team eiBoard',
    notes: 'Private',
    location: 'My Heart Beats vegan',
    color: LightStandardTheme.colorClassSeven,
  ));

  classes.add(Appointment(
    startTime: DateTime.parse('2023-06-19 09:00:00Z'),
    endTime: DateTime.parse('2023-06-19 12:00:00Z'),
    subject: 'Software Eng Präsi prep',
    notes: 'Uni',
    location: 'At home',
    color: LightStandardTheme.colorClassEight,
  ));

  return _AppointmentDataSource(classes);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
