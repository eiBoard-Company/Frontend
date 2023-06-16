import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  String? _bearerToken;
  int? _userID;
  bool? _hasExpired;

  String? get bearerToken => _bearerToken;
  int? get userID => _userID;
  bool? get hasExpired => _hasExpired;

  set bearerToken(String? token) {
    _bearerToken = token;
    notifyListeners();
  }

  set userID(int? id) {
    _userID = id;
    notifyListeners();
  }

  set hasExpired(bool? expiration) {
    _hasExpired = expiration;
    notifyListeners();
  }
}
