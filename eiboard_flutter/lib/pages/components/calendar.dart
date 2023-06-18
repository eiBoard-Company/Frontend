import 'dart:convert';
import 'dart:math';

import 'package:provider/provider.dart';

import '../../utils/auth_provider.dart';
import '../single_event_screen.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'backend_rapla.dart';

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
  String? userID;
  String? bearerToken;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    userID = authProvider.userID;
    bearerToken = authProvider.bearerToken;
  }

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
          dataSource: _getCalendarData(context, bearerToken!, userID!),
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
  final String startTime =
      "${meeting.startTime.hour.toString().padLeft(2, '0')}:${meeting.startTime.minute.toString().padLeft(2, '0')}";
  final String endTime =
      "${meeting.endTime.hour.toString().padLeft(2, '0')}:${meeting.endTime.minute.toString().padLeft(2, '0')}";

  return "$startTime - $endTime";
}

_AppointmentDataSource _getCalendarData(
    BuildContext context, String token, String userID) {
  String startDate = _formatDate(DateTime(2023, 04, 01));
  String endDate = _formatDate(DateTime(2023, 06, 30));
  List<Appointment> classes = [];

  HttpRequest.getLectures(
          false, _formatDate(DateTime(2023, 06, 19)), token, context)
      .then((response) {
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(utf8.decode(response.body.codeUnits));

      for (var lecture in data[0]['lectureList']) {
        classes.add(Appointment(
          startTime: DateTime.parse(lecture['start']),
          endTime: DateTime.parse(lecture['end']),
          subject: lecture['lecture'],
          notes: 'Lecture',
          location: lecture['room'],
          color: getRandomColor(),
        ));
      }
    } else {
      throw Exception('Failed to fetch lectures');
    }
  });

  HttpRequest.getLecturesAll(startDate, endDate, token, context)
      .then((response) {
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(utf8.decode(response.body.codeUnits));

      for (var lecture in data[0]['lectureList']) {
        classes.add(Appointment(
          startTime: DateTime.parse(lecture['start']),
          endTime: DateTime.parse(lecture['end']),
          subject: lecture['lecture'],
          notes: 'Lecture',
          location: lecture['room'],
          color: getRandomColor(),
        ));
      }
    } else {
      throw Exception('Failed to fetch lectures');
    }
  });

  HttpRequest.getEvents(userID, token, context).then((response) {
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(utf8.decode(response.body.codeUnits));

      for (var event in data) {
        classes.add(Appointment(
          startTime: DateTime.parse(event['startDate']),
          endTime: DateTime.parse(event['endDate']),
          subject: event['titel'],
          notes: event['category'],
          location: event['location'],
          color: getRandomColor(),
        ));
      }
    } else {
      throw Exception('Failed to fetch events');
    }
  });

  return _AppointmentDataSource(classes);
}

String _formatDate(DateTime date) {
  String year = date.year.toString();
  String month = date.month.toString().padLeft(2, '0');
  String day = date.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

Color getRandomColor() {
  final colors = [
    LightStandardTheme.colorClassOne,
    LightStandardTheme.colorClassTwo,
    LightStandardTheme.colorClassThree,
    LightStandardTheme.colorClassFour,
    LightStandardTheme.colorClassFive,
    LightStandardTheme.colorClassSix,
    LightStandardTheme.colorClassSeven,
    LightStandardTheme.colorClassEight,
  ];

  final random = Random();
  final index = random.nextInt(colors.length);
  return colors[index];
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
