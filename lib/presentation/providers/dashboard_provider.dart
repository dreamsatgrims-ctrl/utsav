import 'package:flutter/foundation.dart';

import '../../data/models/dashboard_model.dart';
import '../../data/repositories/dashboard_repository.dart';

/// Manages dashboard state and delegates data fetching to the repository.
class DashboardProvider extends ChangeNotifier {
  DashboardProvider(this._repository);

  final DashboardRepository _repository;

  DashboardModel? _data;
  List<QuickActionModel> _quickActions = const [];
  bool _isLoading = false;
  String? _error;

  DashboardModel? get data => _data;
  List<QuickActionModel> get quickActions => _quickActions;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadDashboard() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _data = await _repository.fetchDashboardData();
      _quickActions = _repository.getQuickActions();
    } catch (e) {
      _error = 'Unable to load dashboard. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
