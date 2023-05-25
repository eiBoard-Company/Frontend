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
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;
                        double fontSizeRow = 12.0; // Default font size
                        double iconSize = 14.0;

                        if (screenWidth < 100 &&
                            _calendarController.view == CalendarView.day) {
                          fontSizeRow = 8.0;
                          iconSize = 10.0;
                          //add 2 stages for week view
                        } else if (screenWidth < 120 &&
                            _calendarController.view == CalendarView.week) {
                          fontSizeRow = 5.0;
                          iconSize = 5.0;
                        }

                        return Expanded(
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
                                      fontSize: fontSizeRow,
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
                                            padding: const EdgeInsets.only(
                                                right: 4.0),
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
                                            fontSize: fontSizeRow,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    Text(
                      meeting.subject,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      getTime(details),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ));
          },
        ));
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
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
