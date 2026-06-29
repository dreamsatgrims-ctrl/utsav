import 'package:flutter/material.dart';

import 'calendar_screen.dart';
import 'festival_screen.dart';
import 'panchang_screen.dart';
import 'settings_screen.dart';
import 'dashboard_screen.dart';
import '../widgets/premium_bottom_nav.dart';

/// App shell with premium floating bottom navigation.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          DashboardScreen(onNavigateToTab: _onDestinationSelected),
          const CalendarScreen(),
          const PanchangScreen(),
          const FestivalScreen(),
          const SettingsScreen(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: PremiumBottomNav(
        currentIndex: _currentIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: const [
          NavDestination(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home_rounded,
            label: 'Home',
          ),
          NavDestination(
            icon: Icons.calendar_month_outlined,
            selectedIcon: Icons.calendar_month_rounded,
            label: 'Calendar',
          ),
          NavDestination(
            icon: Icons.wb_sunny_outlined,
            selectedIcon: Icons.wb_sunny_rounded,
            label: 'Panchang',
          ),
          NavDestination(
            icon: Icons.celebration_outlined,
            selectedIcon: Icons.celebration_rounded,
            label: 'Festivals',
          ),
          NavDestination(
            icon: Icons.settings_outlined,
            selectedIcon: Icons.settings_rounded,
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
