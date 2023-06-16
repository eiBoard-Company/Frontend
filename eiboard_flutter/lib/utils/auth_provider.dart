import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  String? _bearerToken;

  String? get bearerToken => _bearerToken;

  set bearerToken(String? token) {
    _bearerToken = token;
    notifyListeners();
  }
}
