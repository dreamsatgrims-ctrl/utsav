import '../models/dashboard_model.dart';

/// Contract for dashboard data access.
abstract class DashboardRepository {
  Future<DashboardModel> fetchDashboardData();

  List<QuickActionModel> getQuickActions();
}
