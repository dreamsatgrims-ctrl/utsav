/// Festival entry for dashboard and festival screens.
class FestivalModel {
  const FestivalModel({
    required this.name,
    required this.date,
    required this.description,
    this.isToday = false,
  });

  final String name;
  final DateTime date;
  final String description;
  final bool isToday;
}
