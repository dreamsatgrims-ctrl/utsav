import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../primary_card.dart';

/// Side-by-side sunrise and sunset timing cards.
class SunTimingsRow extends StatelessWidget {
  const SunTimingsRow({
    super.key,
    required this.sunrise,
    required this.sunset,
  });

  final String sunrise;
  final String sunset;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 360;

        if (isCompact) {
          return Column(
            children: [
              _SunCard(
                label: 'Sunrise',
                time: sunrise,
                icon: Icons.wb_twilight_rounded,
                iconColor: AppColors.secondary,
              ),
              const SizedBox(height: AppSpacing.sm),
              _SunCard(
                label: 'Sunset',
                time: sunset,
                icon: Icons.nights_stay_rounded,
                iconColor: AppColors.primary,
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              child: _SunCard(
                label: 'Sunrise',
                time: sunrise,
                icon: Icons.wb_twilight_rounded,
                iconColor: AppColors.secondary,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _SunCard(
                label: 'Sunset',
                time: sunset,
                icon: Icons.nights_stay_rounded,
                iconColor: AppColors.primary,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SunCard extends StatelessWidget {
  const _SunCard({
    required this.label,
    required this.time,
    required this.icon,
    required this.iconColor,
  });

  final String label;
  final String time;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PrimaryCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: textTheme.bodySmall),
                Text(
                  time,
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
