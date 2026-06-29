import 'festival_model.dart';
import 'panchang_model.dart';

/// Aggregated dashboard data consumed by the presentation layer.
class DashboardModel {
  const DashboardModel({
    required this.greeting,
    required this.today,
    required this.panchang,
    required this.sunrise,
    required this.sunset,
    required this.todayFestival,
    required this.recentFestivals,
  });

  final String greeting;
  final DateTime today;
  final PanchangModel panchang;
  final String sunrise;
  final String sunset;
  final FestivalModel? todayFestival;
  final List<FestivalModel> recentFestivals;
}

/// Quick action tile shown on the dashboard grid.
class QuickActionModel {
  const QuickActionModel({
    required this.label,
    required this.iconName,
  });

  final String label;
  final String iconName;
}
