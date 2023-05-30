import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../themes/light_standard_theme.dart';

class SingleEventScreen {
  static void showAppointmentDialog(
      BuildContext context, Appointment appointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Event"),
          contentPadding: const EdgeInsets.all(16.0),
          content: SingleChildScrollView(
              child: ListBody(children: <Widget>[
            const Divider(
              color: LightStandardTheme.colorLines,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              appointment.subject,
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: LightStandardTheme.colorLightFont,
                      fontSize: 24,
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              appointment.notes ?? 'N/A',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: LightStandardTheme.colorLightFont,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  getTime(appointment),
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: LightStandardTheme.colorLightFont,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ),
                const Spacer(),
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: "${appointment.location}",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ])),
        );
      },
    );
  }

  static String getTime(Appointment appointment) {
    Appointment meeting = appointment;

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
}
