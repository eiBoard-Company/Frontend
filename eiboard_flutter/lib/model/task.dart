class Task {
  final int id;
  final String title;
  final DateTime endDate;
  final String status;
  final int progress;
  final String category;
  final int personId;
  final String? description;

  Task({
    required this.id,
    required this.title,
    required this.endDate,
    required this.status,
    required this.progress,
    required this.category,
    required this.personId,
    this.description,
  });
}
