// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../utils/auth_provider.dart';
import '../login_screen.dart';
import 'custom_drawer.dart';

class HttpRequest {
  static const String baseUrl = 'http://eiboard.de:8090/';
  static const String userEndpoint = 'user/';
  static const String eventEndpoint = 'Event/';
  static const String taskEndpoint = 'task/';

  static Future<http.Response> fetchData(
      String endpoint, String token, BuildContext context) async {
    final response = await http.get(
      Uri.parse(baseUrl + endpoint),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else if (response.statusCode == 401) {
      String? newToken = await refreshToken(token, context);
      return fetchData(endpoint, newToken, context);
    }
    return response;
  }

  static Future<http.Response> postData(
      String endpoint, String token, dynamic data, BuildContext context) async {
    final response = await http.post(
      Uri.parse(baseUrl + endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: data,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else if (response.statusCode == 401) {
      String? newToken = await refreshToken(token, context);
      return postData(endpoint, newToken, data, context);
    }
    return response;
  }

  static Future<http.Response> updateData(String endpoint, String token,
      Map<String, dynamic> data, BuildContext context) async {
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await http.put(
      Uri.parse(baseUrl + endpoint),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('executed');
      return response;
    } else if (response.statusCode == 401) {
      String? newToken = await refreshToken(token, context);
      return updateData(endpoint, newToken, data, context);
    }

    return response;
  }

  static Future<void> createEvent(
      String token, BuildContext context, dynamic data) async {
    postData(eventEndpoint, token, data, context);
  }

  static Future<User> getUser(
      String userID, String token, BuildContext context) async {
    final user = User(null, null, null, null, null, null, null, null);

    http.Response response =
        await fetchData(userEndpoint + userID, token, context);
    String responseString = response.body;
    var jsonMap = json.decode(responseString);
    user.fromJson(jsonMap);

    return user;
  }

  static void updateUser(
      String token, BuildContext context, Map<String, dynamic> data) async {
    await updateData(userEndpoint, token, data, context);
  }

  static Future<void> registerUser(String lastName, String firstName,
      String email, String password, BuildContext context) async {
    var url = Uri.parse('http://185.252.235.49:8090/user');

    var body = {
      'lastName': lastName,
      'firstName': firstName,
      'email': email,
      'password': password,
    };

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        print('Registration successful!');
        sendTokenRequest(context, email, password);
      } else if (response.statusCode == 409) {
        print('Email already exists!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen(
                    userAlreadyExists: true,
                    emailIfUserExists: email,
                  )),
        );
      } else {
        print('Registration failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred during registration: $error');
    }
  }

  static Future<http.StreamedResponse?> sendTokenRequest(
      BuildContext context, String email, String password) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://185.252.235.49:8089/realms/eiBoardKeycloak/protocol/openid-connect/token'));
    request.bodyFields = {
      'client_id': 'eiclient',
      'username': email,
      'password': password,
      'grant_type': 'password',
      'client_secret': 'iJur3UqVPUMj9VCpK8uh1gP9djoRMJpN'
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      var jsonMap = json.decode(responseString);
      var accessToken = jsonMap['access_token'];
      Provider.of<AuthProvider>(context, listen: false).bearerToken =
          accessToken;
      Provider.of<AuthProvider>(context, listen: false).email = email;
      Provider.of<AuthProvider>(context, listen: false).password = password;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
      var userID = decodedToken['userID'];
      Provider.of<AuthProvider>(context, listen: false).userID = userID;

      getUser(userID, accessToken, context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const CustomDrawer();
          },
        ),
      );
      return response;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<String> refreshToken(String token, BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final String? email = authProvider.email;
    final String? password = authProvider.password;

    await sendTokenRequest(context, email!, password!);

    final String? newAccessToken = authProvider.bearerToken;
    return newAccessToken!;
  }

  static Future<http.Response> getLectures(
      bool day, String date, String token, BuildContext context) {
    String baseString = 'lectures/$date';
    if (day) {
      String endpoint = '$baseString/day';
      return fetchData(endpoint, token, context);
    }
    String endpoint = '$baseString/week';
    return fetchData(endpoint, token, context);
  }
}
