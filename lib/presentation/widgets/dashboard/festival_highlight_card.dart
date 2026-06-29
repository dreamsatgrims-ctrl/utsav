import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../data/models/festival_model.dart';
import '../primary_card.dart';

/// Highlights today's festival or an empty state when none exists.
class FestivalHighlightCard extends StatelessWidget {
  const FestivalHighlightCard({
    super.key,
    this.festival,
  });

  final FestivalModel? festival;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (festival == null) {
      return PrimaryCard(
        child: Row(
          children: [
            Icon(
              Icons.celebration_outlined,
              color: AppColors.textSecondary.withValues(alpha: 0.6),
              size: 32,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                'No major festival today. Enjoy a peaceful day.',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return PrimaryCard(
      backgroundColor: AppColors.primaryContainer,
      borderColor: AppColors.primary.withValues(alpha: 0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.celebration_rounded,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Festival",
                  style: textTheme.labelMedium?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  festival!.name,
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  festival!.description,
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
