import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_durations.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_shadows.dart';
import '../../core/theme/app_spacing.dart';

/// Navigation destination for [PremiumBottomNav].
class NavDestination {
  const NavDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

/// Floating rounded bottom navigation with animated selection highlight.
class PremiumBottomNav extends StatelessWidget {
  const PremiumBottomNav({
    super.key,
    required this.currentIndex,
    required this.destinations,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final List<NavDestination> destinations;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        bottomPadding > 0 ? AppSpacing.sm : AppSpacing.md,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppRadius.xlBorder,
          boxShadow: AppShadows.navBar,
        ),
        child: ClipRRect(
          borderRadius: AppRadius.xlBorder,
          child: Material(
            color: AppColors.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                children: List.generate(destinations.length, (index) {
                  return Expanded(
                    child: _NavItem(
                      destination: destinations[index],
                      isSelected: currentIndex == index,
                      onTap: () => onDestinationSelected(index),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.isSelected,
    required this.onTap,
  });

  final NavDestination destination;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      button: true,
      selected: isSelected,
      label: destination.label,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: AppDurations.normal,
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryContainer : Colors.transparent,
            borderRadius: AppRadius.largeBorder,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.1 : 1.0,
                duration: AppDurations.normal,
                curve: Curves.easeOutCubic,
                child: Icon(
                  isSelected ? destination.selectedIcon : destination.icon,
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                  size: 24,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              AnimatedDefaultTextStyle(
                duration: AppDurations.normal,
                style: (isSelected
                        ? textTheme.labelMedium
                        : textTheme.labelSmall)!
                    .copyWith(
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
                child: Text(
                  destination.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
