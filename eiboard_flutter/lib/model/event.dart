class Event {
  final int id;
  final String? description;
  final DateTime startDate;
  final DateTime endDate;
  final String? location;
  final String category;
  final int personId;
  final String title;

  Event({
    required this.id,
    this.description,
    required this.startDate,
    required this.endDate,
    this.location,
    required this.category,
    required this.personId,
    required this.title,
  });
}
