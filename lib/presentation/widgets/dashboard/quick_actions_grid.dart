import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../data/models/dashboard_model.dart';
import '../primary_card.dart';

/// Grid of quick action shortcuts on the dashboard.
class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({
    super.key,
    required this.actions,
    this.onActionTap,
  });

  final List<QuickActionModel> actions;
  final ValueChanged<int>? onActionTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 500 ? 4 : 2;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppSpacing.sm,
            mainAxisSpacing: AppSpacing.sm,
            childAspectRatio: 1.4,
          ),
          itemCount: actions.length,
          itemBuilder: (context, index) {
            final action = actions[index];
            return _QuickActionTile(
              action: action,
              onTap: () => onActionTap?.call(index),
            );
          },
        );
      },
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  const _QuickActionTile({
    required this.action,
    this.onTap,
  });

  final QuickActionModel action;
  final VoidCallback? onTap;

  IconData _resolveIcon() {
    return switch (action.iconName) {
      'calendar_month' => Icons.calendar_month_rounded,
      'wb_sunny' => Icons.wb_sunny_rounded,
      'celebration' => Icons.celebration_rounded,
      'notifications' => Icons.notifications_rounded,
      _ => Icons.apps_rounded,
    };
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PrimaryCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _resolveIcon(),
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            action.label,
            style: textTheme.labelMedium,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
