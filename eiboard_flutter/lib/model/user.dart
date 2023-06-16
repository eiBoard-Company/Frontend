import 'event.dart';
import 'task.dart';

class User {
  final int id;
  final String lastName;
  final String firstName;
  final String email;
  final String? imagePath;
  final String raplaURL;
  final List<Task>? tasks;
  final List<Event>? events;

  User(this.id, this.lastName, this.firstName, this.email, this.imagePath,
      this.raplaURL, this.tasks, this.events);
}
