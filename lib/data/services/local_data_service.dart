import '../../core/constants/app_constants.dart';
import '../models/dashboard_model.dart';
import '../models/festival_model.dart';
import '../models/panchang_model.dart';

/// Local data source for mock and cached content until API integration.
class LocalDataService {
  const LocalDataService();

  PanchangModel getTodayPanchang() {
    return const PanchangModel(
      tithi: 'Shukla Paksha, Dashami',
      nakshatra: 'Rohini',
      yoga: 'Siddha',
      karana: 'Bava',
      paksha: 'Shukla Paksha',
      hinduMonth: 'Jyeshtha',
    );
  }

  FestivalModel getTodayFestival(DateTime today) {
    return FestivalModel(
      name: 'Ganga Dussehra',
      date: today,
      description: 'A sacred day honoring the descent of River Ganga.',
      isToday: true,
    );
  }

  List<FestivalModel> getRecentFestivals(DateTime today) {
    return [
      FestivalModel(
        name: 'Nirjala Ekadashi',
        date: today.subtract(const Duration(days: 3)),
        description: 'A strict fasting day dedicated to Lord Vishnu.',
      ),
      FestivalModel(
        name: 'Vat Savitri Vrat',
        date: today.subtract(const Duration(days: 7)),
        description: 'Observed for marital bliss and longevity.',
      ),
      FestivalModel(
        name: 'Akshaya Tritiya',
        date: today.subtract(const Duration(days: 14)),
        description: 'An auspicious day for new beginnings.',
      ),
    ];
  }

  List<QuickActionModel> getQuickActions() {
    return const [
      QuickActionModel(label: 'Calendar', iconName: 'calendar_month'),
      QuickActionModel(label: 'Panchang', iconName: 'wb_sunny'),
      QuickActionModel(label: 'Festivals', iconName: 'celebration'),
      QuickActionModel(label: 'Reminders', iconName: 'notifications'),
    ];
  }

  Future<void> simulateNetworkDelay() async {
    await Future<void>.delayed(AppConstants.repositoryDelay);
  }
}
