import '../../utils/date_utils.dart';
import '../models/dashboard_model.dart';
import '../services/local_data_service.dart';
import 'dashboard_repository.dart';

/// Repository implementation backed by [LocalDataService].
class DashboardRepositoryImpl implements DashboardRepository {
  const DashboardRepositoryImpl(this._localDataService);

  final LocalDataService _localDataService;

  @override
  Future<DashboardModel> fetchDashboardData() async {
    await _localDataService.simulateNetworkDelay();

    final now = DateTime.now();

    return DashboardModel(
      greeting: AppDateUtils.getGreeting(now),
      today: now,
      panchang: _localDataService.getTodayPanchang(),
      sunrise: '5:42 AM',
      sunset: '7:18 PM',
      todayFestival: _localDataService.getTodayFestival(now),
      recentFestivals: _localDataService.getRecentFestivals(now),
    );
  }

  @override
  List<QuickActionModel> getQuickActions() {
    return _localDataService.getQuickActions();
  }
}
