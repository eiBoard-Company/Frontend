import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

import '../../utils/auth_provider.dart';

class HttpRequest {
  static const String baseUrl = 'http://eiboard.de:8090/';
  static const String userEndpoint = 'user/';
  static const String entryEndpoint = 'entry/';
  static const String entriesEndpoint = 'entries/';

  static Future<http.Response> fetchData(String endpoint, String token) async {
    final response = await http.get(
      Uri.parse(baseUrl + endpoint),
      headers: {'Authorization': 'Bearer $token'},
    );
    return response;
  }

  static Future<http.Response> postData(
      String endpoint, String token, dynamic data) async {
    final response = await http.post(
      Uri.parse(baseUrl + endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: data,
    );
    return response;
  }

  static void sendTokenRequest(BuildContext context) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://185.252.235.49:8089/realms/eiBoardKeycloak/protocol/openid-connect/token'));
    request.bodyFields = {
      'client_id': 'eiclient',
      'username': 'user',
      'password': 'test',
      'grant_type': 'password',
      'client_secret': 'iJur3UqVPUMj9VCpK8uh1gP9djoRMJpN'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      var jsonMap = json.decode(responseString);
      var accessToken = jsonMap['access_token'];
      bool hasExpired = JwtDecoder.isExpired(accessToken);
      // ignore: use_build_context_synchronously
      Provider.of<AuthProvider>(context, listen: false).bearerToken =
          accessToken;
      // ignore: use_build_context_synchronously
      Provider.of<AuthProvider>(context, listen: false).hasExpired = hasExpired;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
      var userID = decodedToken['userID'];
      // ignore: use_build_context_synchronously
      Provider.of<AuthProvider>(context, listen: false).userID = userID;
      print(accessToken);
      print(decodedToken);
      print(userID);
    } else {
      print(response.reasonPhrase);
    }
  }

  //TODO: see if needed
  static String getLectureString(bool day, DateTime date) {
    String baseString = 'lectures/$date';
    if (day) {
      return '$baseString/day';
    }
    return '$baseString/week';
  }
}
