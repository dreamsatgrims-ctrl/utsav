import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/repositories/dashboard_repository.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../data/services/local_data_service.dart';
import '../providers/dashboard_provider.dart';

/// Central registry of application-wide [Provider] instances.
class AppProviders {
  AppProviders._();

  static List<SingleChildWidget> get providers => [
        Provider<DashboardRepository>(
          create: (_) => DashboardRepositoryImpl(const LocalDataService()),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(
            context.read<DashboardRepository>(),
          ),
        ),
      ];
}
