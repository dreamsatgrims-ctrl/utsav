import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_spacing.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/dashboard/festival_highlight_card.dart';
import '../widgets/dashboard/greeting_header.dart';
import '../widgets/dashboard/panchang_card.dart';
import '../widgets/dashboard/quick_actions_grid.dart';
import '../widgets/dashboard/recent_festivals_section.dart';
import '../widgets/dashboard/sun_timings_row.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/primary_button.dart';
import '../widgets/section_title.dart';

/// Main dashboard with greeting, panchang, and festival overview.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    this.onNavigateToTab,
  });

  final ValueChanged<int>? onNavigateToTab;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardProvider>().loadDashboard();
    });
  }

  void _handleQuickAction(int index) {
    final tabIndex = switch (index) {
      0 => AppConstants.calendarTabIndex,
      1 => AppConstants.panchangTabIndex,
      2 => AppConstants.festivalsTabIndex,
      _ => null,
    };
    if (tabIndex != null) {
      widget.onNavigateToTab?.call(tabIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading && provider.data == null) {
          return const LoadingWidget(message: 'Loading your day…');
        }

        if (provider.error != null && provider.data == null) {
          return EmptyStateWidget(
            title: 'Something went wrong',
            message: provider.error,
            icon: Icons.error_outline_rounded,
            actionLabel: 'Retry',
            onAction: provider.loadDashboard,
          );
        }

        final data = provider.data;
        if (data == null) {
          return const EmptyStateWidget(
            title: 'No data available',
            message: 'Pull to refresh or try again later.',
          );
        }

        return RefreshIndicator(
          onRefresh: provider.loadDashboard,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final horizontalPadding = constraints.maxWidth > 600
                  ? AppSpacing.xl
                  : AppSpacing.md;

              return CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      MediaQuery.paddingOf(context).top + AppSpacing.lg,
                      horizontalPadding,
                      AppSpacing.xxl + AppSpacing.lg,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        GreetingHeader(
                          greeting: data.greeting,
                          today: data.today,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        PanchangCard(panchang: data.panchang),
                        const SizedBox(height: AppSpacing.md),
                        SunTimingsRow(
                          sunrise: data.sunrise,
                          sunset: data.sunset,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        FestivalHighlightCard(festival: data.todayFestival),
                        const SizedBox(height: AppSpacing.lg),
                        const SectionTitle(title: 'Quick Actions'),
                        QuickActionsGrid(
                          actions: provider.quickActions,
                          onActionTap: _handleQuickAction,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        SectionTitle(
                          title: 'Recent Festivals',
                          actionLabel: 'See all',
                          onActionTap: () => widget.onNavigateToTab
                              ?.call(AppConstants.festivalsTabIndex),
                        ),
                        RecentFestivalsSection(
                          festivals: data.recentFestivals,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        PrimaryButton(
                          label: 'View Full Panchang',
                          icon: Icons.arrow_forward_rounded,
                          expand: true,
                          onPressed: () => widget.onNavigateToTab
                              ?.call(AppConstants.panchangTabIndex),
                        ),
                      ]),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
