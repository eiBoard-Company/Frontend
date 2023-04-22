import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;

class HttpRequest {
  Future<http.Response> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:8090/user'));
    var encoded = utf8.encode(response.body);
    var decoded = utf8.decode(encoded);
    return response;
  }
}
