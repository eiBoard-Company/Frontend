import 'dart:core';

class TaskListObject {
  String? taskname;
  String? subject;
  String? description;
  DateTime? time;
  String? dueValue;
  double? completeValue;
  String? typId;

  TaskListObject(
      {this.taskname,
      this.subject,
      this.description,
      this.time,
      this.dueValue,
      this.completeValue,
      this.typId});
}
