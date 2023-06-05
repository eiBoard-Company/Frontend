import 'package:intl/intl.dart';

class DateTimeFormatter {
  static DateTime formatDateTime(String inputDate, String inputTime) {
    final DateFormat inputFormatDate = DateFormat('MMMM d, yyyy');
    final DateTime date = inputFormatDate.parse(inputDate);

    final DateFormat inputFormatTime = DateFormat('h:mm a');
    final DateTime time = inputFormatTime.parse(inputTime);

    final DateTime dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
      time.second,
    );

    return dateTime;
  }
}
