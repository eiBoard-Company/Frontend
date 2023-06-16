import 'event.dart';
import 'task.dart';
import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  int? _id;
  String? _lastName;
  String? _firstName;
  String? _email;
  String? password;
  String? _imagePath;
  String? _raplaURL;
  List<Task>? tasks;
  List<Event>? events;

  User(this._id, this._lastName, this._firstName, this._email, this.password,
      this._imagePath, this._raplaURL, this.tasks, this.events);

  int? get id => _id;
  String? get lastName => _lastName;
  String? get firstName => _firstName;
  String? get email => _email;
  String? get imagePath => _imagePath;
  String? get raplaURL => _raplaURL;

  set iD(int? id) {
    _id = id;
    notifyListeners();
  }

  set lastName(String? lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  set firstName(String? firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  set raplaURL(String? raplaURL) {
    _raplaURL = raplaURL;
    notifyListeners();
  }

  set email(String? email) {
    _email = email;
    notifyListeners();
  }

  set imagePath(String? imagePath) {
    _imagePath = imagePath;
    notifyListeners();
  }
}
