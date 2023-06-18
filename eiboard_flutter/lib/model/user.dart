import 'event.dart';
import 'task.dart';
import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  int? _id;
  String? _lastName;
  String? _firstName;
  String? _email;
  String? _imagePath;
  String? _raplaURL;
  List<Task>? tasks;
  List<Event>? events;

  User(
    this._id,
    this._lastName,
    this._firstName,
    this._email,
    this._imagePath,
    this._raplaURL,
    this.tasks,
    this.events,
  );

  int? get id => _id;
  String? get lastName => _lastName;
  String? get firstName => _firstName;
  String? get email => _email;
  String? get imagePath => _imagePath;
  String? get raplaURL => _raplaURL;

  set id(int? id) {
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

  void fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _lastName = json['lastName'];
    _firstName = json['firstName'];
    _email = json['email'];
    _imagePath = json['picture'];
    _raplaURL = json['raplaLink'];
    //TODO: Parse and assign tasks and events if needed
    notifyListeners();
  }
}
