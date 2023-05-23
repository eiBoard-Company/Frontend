import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;

class HttpRequest {
  static const String url = 'http://localhost:8090/';
  static const String user = 'user/';
  static const String entry = 'entry/';
  static const String entries = 'entries';

  static Future<http.Response> fetchData(String buildUrl) async {
    final response = await http.get(Uri.parse(buildUrl));
    var encoded = utf8.encode(response.body);
    // ignore: unused_local_variable
    var decoded = utf8.decode(encoded);
    return response;
  }

  static String getLectureString(bool day, DateTime date) {
    String baseString = 'lectures/$date';
    if (day) {
      return '$baseString/day';
    }
    return '$baseString/week';
  }
}
