/// Panchang details for a given day.
class PanchangModel {
  const PanchangModel({
    required this.tithi,
    required this.nakshatra,
    required this.yoga,
    required this.karana,
    required this.paksha,
    required this.hinduMonth,
  });

  final String tithi;
  final String nakshatra;
  final String yoga;
  final String karana;
  final String paksha;
  final String hinduMonth;
}
