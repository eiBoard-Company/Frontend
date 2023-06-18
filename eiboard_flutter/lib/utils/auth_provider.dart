import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  String? _bearerToken;
  String? _email;
  String? _password;
  String? _userID;
  bool? _hasExpired;

  String? get bearerToken => _bearerToken;
  String? get userID => _userID;
  bool? get hasExpired => _hasExpired;
  String? get password => _password;
  String? get email => _email;

  set bearerToken(String? token) {
    _bearerToken = token;
    notifyListeners();
  }

  set userID(String? id) {
    _userID = id;
    notifyListeners();
  }

  set email(String? email) {
    _email = email;
    notifyListeners();
  }

  set password(String? password) {
    _password = password;
    notifyListeners();
  }

  set hasExpired(bool? expiration) {
    _hasExpired = expiration;
    notifyListeners();
  }
}
